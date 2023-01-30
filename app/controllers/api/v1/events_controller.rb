class Api::V1::EventsController < ApplicationController
  skip_before_action :authenticate_user, only: [:index]
  before_action :set_event, only: %i[ show update destroy participants remove_attachments]

  # GET /api/v1/events
  def index
    if params[:limit].present?
      @events = Event.limit(params[:limit]).order('created_at DESC')
    else    
      @events = Event.all.order('created_at DESC')
    end
    render json: @events
  end

  # GET /api/v1/events/1
  def show
    render json: @event
  end

  # POST /api/v1/events
  def create
    @event = Event.new(event_params)
    add_attachements_accordingly(@event)

    if @event.save
      render json: @event, status: :created
    else
      render json: @event.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /api/v1/events/1
  def update    
    add_attachements_accordingly(@event, TRUE)

    if @event.update(event_params)
      render json: @event
    else
      render json: @event.errors, status: :unprocessable_entity
    end
  end

  # DELETE /api/v1/events/1
  def destroy
    @event.destroy
  end

 
  def participants
    if @current_user.is_admin 
      @participants = @event.participants
    else
      @participants = @event.participants.where(locality: @current_user.locality)
    end

    render json: @participants
  end


  def search
    @events = Event.filtered_by_search(params[:query])

    render json: @events
  end

  # POST /api/v1/events/1/remove_attachments
  def remove_attachments    
    remain_files = @event.attachments
    deleted_file = remain_files.delete_at(params[:file_index].to_i)
    deleted_file.try(:remove!)
    @event.attachments = remain_files

    # @event.remove_attachments!
    @event.save

    render json: @events
  end
  

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_event
      @event = Event.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def event_params
      # params.fetch(:api_v1_event, {})
      params.permit(:title, :start_date, :end_date, :start_time, :end_time, :is_closed, :is_archived)
    end

    def add_attachements_accordingly(event, overwrite = FALSE)
      if (params[:attachments])
        files = event.attachments 

        existing_files = Array.new  
        new_files = Array.new      
        event.attachments.each { |x| existing_files << x.identifier }
          
        params[:attachments].each_with_index do |y, i|
          if existing_files.include?(y.original_filename)
            if overwrite
              deleted_file = files.delete_at(i)
              deleted_file.try(:remove!)
              event.attachments = files
              new_files << y
            end
          else
            new_files << y
          end
        end
       
        files += new_files
        event.attachments = files
      end
    end

end
