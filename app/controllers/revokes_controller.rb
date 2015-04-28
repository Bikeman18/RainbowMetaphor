class RevokesController < ApplicationController
  before_action :set_revoke, only: [:show, :update, :destroy]

  # GET /revokes
  # GET /revokes.json
  def index
    @revokes = Revoke.all

    render json: @revokes
  end

  # GET /revokes/1
  # GET /revokes/1.json
  def show
    render json: @revoke
  end

  # POST /revokes
  # POST /revokes.json
  def create
    @revoke = Revoke.new(revoke_params)

    if @revoke.save
      render json: @revoke, status: :created, location: @revoke
    else
      render json: @revoke.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /revokes/1
  # PATCH/PUT /revokes/1.json
  def update
    @revoke = Revoke.find(params[:id])

    if @revoke.update(revoke_params)
      head :no_content
    else
      render json: @revoke.errors, status: :unprocessable_entity
    end
  end

  # DELETE /revokes/1
  # DELETE /revokes/1.json
  def destroy
    @revoke.destroy

    head :no_content
  end

  private

    def set_revoke
      @revoke = Revoke.find(params[:id])
    end

    def revoke_params
      params.require(:revoke).permit(:user_id, :key_id)
    end
end
