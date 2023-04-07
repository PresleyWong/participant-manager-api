class Api::V1::EventsController < ApplicationController
  skip_before_action :authenticate_user, only: [:index]
  before_action :set_event, only: %i[show update destroy participants remove_attachments]

  # GET /api/v1/events
  def index
    if params[:limit].present?    
      @events = Event.where(is_archived: FALSE).limit(params[:limit]).order('created_at DESC')
    else    
      @events = Event.where(is_archived: FALSE).order('created_at DESC')      
    end

    render json: include_attachments(@events, TRUE)
  end

  # GET /api/v1/events/1
  def show
    render json: @event
  end

  # POST /api/v1/events
  def create
    @event = Event.new(event_params.except(:attachments))        
    if @event.save

      if (params[:attachments])          
        params[:attachments].each do |file|
          @event.attachments.attach(file)
        end
      end

      render json: @event, status: :created
    else
      render json: @event.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /api/v1/events/1
  def update    
    if params[:toggle]
      case params[:toggle]
      when "is_closed"
        @event.is_closed = !@event.is_closed
      when "is_archived"
        @event.is_archived = !@event.is_archived
      end

      @event.save
      return render json: @events
    end

    add_attachements_accordingly(@event)
    
    if @event.update(event_params.except(:attachments))
      render json: include_attachments(@event)
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


  # POST /api/v1/events/1/remove_attachments
  def remove_attachments    
    attachments = ActiveStorage::Attachment.find(params[:file_index])
    attachments.purge
    render json: include_attachments(@event)
  end

  # Get /api/v1/events/archive
  def archive  
    @events = Event.where(is_archived: TRUE).order('created_at DESC')      
    render json: include_attachments(@events, TRUE)
  end
  

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_event
      @event = Event.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def event_params
      params.permit(:title, :start_date, :end_date, :start_time, :end_time, :is_closed, :is_archived, attachments: [])
    end

    def add_attachements_accordingly(event)
      if (event_params[:attachments])          
        event_params[:attachments].each do |file|
          event.attachments.attach(file)
        end
      end
    end

    def include_attachments(obj, multiple=FALSE)
      if multiple
          events_with_attachments = []
          obj.each do |event|
            events_with_attachments << event.as_json(include: :attachments).merge(
              attachments: event.attachments.map do |file|
                {"id" => file.id, "url" => url_for(file)}          
              end
              )
          end       

          return events_with_attachments
      else
        return (
          obj.as_json(include: :attachments).merge(
            attachments: obj.attachments.map do |file|
            {"id" => file.id, "url" => url_for(file)}   
          end )
        )
      end

    end

end
