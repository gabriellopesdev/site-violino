class Api::V1::ProgressesController < ApplicationController
  before_action :set_progress, only: [:show, :update, :destroy]

  # GET /api/v1/progresses
  def index
    @progresses = Progress.all
    render json: @progresses
  end

  # GET /api/v1/progresses/:id
  def show
    render json: @progress
  end

  # POST /api/v1/progresses
  def create
    @progress = Progress.new(progress_params)
    if @progress.save
      render json: @progress, status: :created
    else
      render json: @progress.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /api/v1/progresses/:id
  def update
    if @progress.update(progress_params)
      render json: @progress
    else
      render json: @progress.errors, status: :unprocessable_entity
    end
  end

  # DELETE /api/v1/progresses/:id
  def destroy
    @progress.destroy
    head :no_content
  end

  private

  def set_progress
    @progress = Progress.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    render json: { error: 'Progress not found' }, status: :not_found
  end

  def progress_params
    params.require(:progress).permit(:attribute1, :attribute2, :attribute3) # Replace with actual attributes
  end
end
