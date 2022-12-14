class Api::V1::EventsController < ApplicationController
  skip_before_action :authenticate_user, only: [:index]
  before_action :set_event, only: %i[ show update destroy participants add_participant remove_participant participant_appointment]

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

    if @event.save
      render json: @event, status: :created
    else
      render json: @event.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /api/v1/events/1
  def update
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
  

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_event
      @event = Event.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def event_params
      # params.fetch(:api_v1_event, {})
      params.permit(:title, :start_date, :end_date, :start_time, :end_time)
    end

end
