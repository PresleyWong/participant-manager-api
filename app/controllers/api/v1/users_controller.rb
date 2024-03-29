class Api::V1::UsersController < ApplicationController
  skip_before_action :authenticate_user, only: [:create]
  before_action :set_user, only: %i[ show update destroy appointments]

  # GET /users
  def index
    @users = User.all.order('created_at DESC')
    render json: @users, status: 200
  end

  # GET /users/1
  def show
    render json: @user, status: 200
  end

  # POST /users
  def create
    @user = User.new(user_params)

    if @user.save
      render json: @user, status: :created
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /users/1
  def update
    if params[:password].blank?
      if @user.update(user_params)
        render json: @user
      else
        render json: @user.errors, status: :unprocessable_entity
      end
    else
      @user.enforce_password_validation
      if @user.update(user_params)
        render json: @user
      else
        render json: @user.errors, status: :unprocessable_entity
      end
    end
  end

  # DELETE /users/1
  def destroy
    @user.destroy
  end


  def appointments
    @appointments = @user.appointments

    render json: @appointments
  end



  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def user_params
      # params.fetch(:user, {})
      params.permit(:email, :password, :is_admin, :locality, :name)
    end
end
