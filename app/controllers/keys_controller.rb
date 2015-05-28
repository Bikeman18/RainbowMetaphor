class KeysController < ApplicationController
  before_action :set_key, only: [:show, :destroy]
  before_action :set_user, only: [:create]
  # GET /keys
  # GET /keys.json
  def index
    @keys = Key.all

    render json: @keys
  end

  # GET /keys/1
  # GET /keys/1.json
  def show
    render json: @key
  end

  # POST /keys
  # POST /keys.json
  def create
        
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
    @keys=User.find(params[:id]).keys.where("created_at > ?", params[:last_get])

    render json: @keys
  end

  # DELETE /keys/1
  # DELETE /keys/1.json
  def destroy
    @keychange=Keychange.new(user_id:@key.user_id,change:params[:id])
    if @keychange.save
        @key.destroy
        head :no_content
    end
  end

  private

    def set_key
      @key = Key.find(params[:id])
    end
    
    def set_user
      if params[:key][:phone_number]
        @user=User.find_by(phone_number: params[:key][:phone_number])
        if @user
          p @user.id
          p params[:key][:admin_id].to_i
          if @user.id==params[:key][:admin_id].to_i
             render json: {forbid:'can not share to youself'} ,status: :unprocessable_entity
          else
            params[:key][:user_id]=@user.id
          end
        else
          render json: {error:'this phoneNumber has no id'} ,status: :unprocessable_entity
        end
      end
    end
    
    def key_params
      params.require(:key).permit(:user_id, :admin_id, :mac, :passphrase, :idinlock)
    end
end
