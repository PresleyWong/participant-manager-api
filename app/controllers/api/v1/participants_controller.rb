class Api::V1::ParticipantsController < ApplicationController
  before_action :set_participant, only: %i[ show update destroy events]

  # GET /api/v1/participants
  def index
    if @current_user.is_admin
      @participants = Participant.all.order('english_name ASC')
    else
      @participants = Participant.where(:locality => @current_user.locality).order('english_name ASC')
    end

    render json: @participants
  end

  # GET /api/v1/participants/1
  def show
    render json: @participant
  end

  # POST /api/v1/participants
  def create
    @participant = Participant.new(participant_params)

    if @participant.save
      render json: @participant, status: :created
    else
      render json: @participant.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /api/v1/participants/1
  def update
    if @participant.update(participant_params)
      render json: @participant
    else
      render json: @participant.errors, status: :unprocessable_entity
    end
  end

  # DELETE /api/v1/participants/1
  def destroy
    @participant.destroy
  end

  
  def events
      @events = @participant.events

    render json: @events
  end


  def search   
    if @current_user.is_admin       
      @participants = Participant.search_by_admin(params[:query])
    else
      @participants = Participant.search_by_non_admin(params[:query], @current_user.locality)
    end

    # search_results = Participant.where("english_name ILIKE ?", "%#{params[:query]}%").or(Participant.where("chinese_name ILIKE ?", "%#{params[:query]}%")).and(Participant.where('locality IN (?)', @current_user.locality))    
    # search_results.each do |item|
    #   event_appointment = item.appointments.where(event_id: params[:event_id])       
    #   if !event_appointment.empty?
    #     @joined_search_results << (item.as_json.merge(event_appointment.first.slice("language","remarks").as_json))
    #   else      
    #     @joined_search_results << item.as_json
    #   end
    # end

    render json: @participants
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_participant
      @participant = Participant.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def participant_params
      # params.fetch(:api_v1_participant, {})
      params.permit(:gender, :english_name, :chinese_name, :email, :phone, :college, :academic_year, :locality)
    end

end
