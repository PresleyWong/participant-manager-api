class Api::V1::EventsController < ApplicationController
  before_action :set_event, only: %i[ show update destroy participants add_participant remove_participant]

  # GET /api/v1/events
  def index
    @events = Event.all

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


  def add_participant
    # @appointment = Appointment.new(participant_id: params[:participant_id], event_id: params[:event_id], user_id: @current_user.id)
    @appointment = @event.appointments.new(participant_id: params[:participant_id], user_id: @current_user.id)

    if @appointment.save
      render json: @appointment, status: :created
    else
      render json: @appointment.errors, status: :unprocessable_entity
    end
  end

  def remove_participant
    @appointment = @event.appointments.where(participant_id: params[:participant_id])
    @appointment.destroy_all
    # Appointment.where(participant_id: params[:participant_id], event_id: params[:event_id]).destroy_all
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
