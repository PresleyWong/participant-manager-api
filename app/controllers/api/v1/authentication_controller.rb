class Api::V1::AuthenticationController < ApplicationController
    skip_before_action :authenticate_user

    def login
        @user = User.find_by_email(params[:email])
        if @user&.authenticate(params[:password])
            token = jwt_encode(user_id: @user.id)
            time = Time.now + 24.hours.to_i
            render json: { token: token, 
                            exp: time.strftime("%m-%d-%Y %H:%M"), 
                            email: @user.email, 
                            id: @user.id,
                            locality: @user.locality,
                            isAdmin: @user.is_admin,
                        }, status: :ok
        else
            render json: { errors: 'unauthorized' }, status: :unauthorized
        end
    end

end
