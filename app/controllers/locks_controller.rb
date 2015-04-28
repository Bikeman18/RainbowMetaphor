class LocksController < ApplicationController
  before_action :set_lock, only: [:show, :update, :destroy]

  # GET /locks
  # GET /locks.json
  def index
    @locks = Lock.all

    render json: @locks
  end

  # GET /locks/1
  # GET /locks/1.json
  def show
    render json: @lock
  end

  # POST /locks
  # POST /locks.json
  def create
    @lock = Lock.new(lock_params)

    if @lock.save
      render json: @lock, status: :created, location: @lock
    else
      render json: @lock.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /locks/1
  # PATCH/PUT /locks/1.json
  def update
    @lock = Lock.find(params[:id])

    if @lock.update(lock_params)
      head :no_content
    else
      render json: @lock.errors, status: :unprocessable_entity
    end
  end

  # DELETE /locks/1
  # DELETE /locks/1.json
  def destroy
    @lock.destroy

    head :no_content
  end

  private

    def set_lock
      @lock = Lock.find(params[:id])
    end

    def lock_params
      params.require(:lock).permit(:admin_id, :mac)
    end
end
