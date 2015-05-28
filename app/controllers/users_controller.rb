class UsersController < ApplicationController
  before_action :set_user, only: [:show, :update, :destroy]

  # GET /users
  # GET /users.json
  def index
    def as_json(options={})
      super(:methods => [:username, :time_ago], except: [:created_at, :updated_at])
    end
    @users = User.all

    render json: @users.as_json(
      only: [:id, :nicknam, :publickey]
    )
  end

  # GET /users/1
  # GET /users/1.json
  def show
    render json: @user
  end

  # POST /users
  # POST /users.json
  def create
    @user = User.new(user_params)

    if @user.save
      render json: @user, status: :created, location: @user
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    @user = User.find(params[:id])
    
    if @user.update(update_params)
      head :no_content
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user.destroy

    head :no_content
  end

  private

    def set_user
      @user = User.find(params[:id])
    end
    
    def update_params
      params.require(:user).permit(:nickname, :publickey, :avatar)
    end
    
    def user_params
      params.require(:user).permit(:phone_number, :password, :nickname, :publickey)
    end
end
