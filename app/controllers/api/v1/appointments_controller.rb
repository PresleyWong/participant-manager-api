class Api::V1::AppointmentsController < ApplicationController
    before_action :set_appointment, only: %i[update destroy]
    
    def create
        @appointment = Appointment.new(appointment_params) do |param|
            param.event_id = params[:event_id]
            param.participant_id = params[:participant_id]
            param.user_id = @current_user.id
        end

        if @appointment.save
          render json: @appointment, status: :created
        else
          render json: @appointment.errors, status: :unprocessable_entity
        end
    end
  

    def update
      if @appointment.update(appointment_params)
        render json: @appointment
      else
        render json: @appointment.errors, status: :unprocessable_entity
      end
    end


    def destroy
        @appointment.destroy
    end
   

    def participant_appointment
        @appointment = Appointment.where(event_id: params[:event_id], participant_id: params[:participant_id])        
        render json: @appointment
    end
  
  
    private
      def set_appointment
        @appointment = Appointment.find(params[:id])
      end
  
      def appointment_params
        params.permit(:language, :remarks)
      end
  
  end
  