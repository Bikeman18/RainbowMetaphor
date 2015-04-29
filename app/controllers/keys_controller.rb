class KeysController < ApplicationController
  before_action :set_key, only: [:show, :update, :destroy]
  before_action :set_user, only: [:create]
  # GET /keys
  # GET /keys.json
  def index
    @keys = Key.all

    render json: @keys.as_json(
      only: [:id, :nickname]
    )
  end

  # GET /keys/1
  # GET /keys/1.json
  def show
    render json: @key
  end

  # POST /keys
  # POST /keys.json
  def create
        
        # @user=User.where("phone_number= ?", params[:key][:phone_number])
        # render json: @user
    @key = Key.new(key_params)

    if @key.save
      render json: @key, status: :created, location: @key
    else
      render json: @key.errors, status: :unprocessable_entity
    end
    
  end

  # PATCH/PUT /keys/1
  # PATCH/PUT /keys/1.json
  def update
    @key = Key.find(params[:id])

    if @key.update(key_params)
      head :no_content
    else
      render json: @key.errors, status: :unprocessable_entity
    end
  end

  # DELETE /keys/1
  # DELETE /keys/1.json
  def destroy
    @key.destroy

    head :no_content
  end

  private

    def set_key
      @key = Key.find(params[:id])
    end
    
    def set_user
      if params[:key][:phone_number]
         @user=User.find_by(phone_number: params[:key][:phone_number])
         if @user
          params[:key][:user_id]=@user.id
         else
          render json: {error:'this phoneNumber has no id'} ,status: :unprocessable_entity
         end
      end
    end
    
    def key_params
      params.require(:key).permit(:user_id, :admin_id, :mac, :passphrase)
    end
end
