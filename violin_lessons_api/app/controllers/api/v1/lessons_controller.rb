class Api::V1::LessonsController < ApplicationController
  before_action :set_lesson, only: [ :show, :update, :destroy ]

  # GET /api/v1/lessons
  def index
    @lessons = Lesson.all
    render json: @lessons
  end

  # GET /api/v1/lessons/:id
  def show
    render json: @lesson
  end

  # POST /api/v1/lessons
  def create
    @lesson = Lesson.new(lesson_params)
    if @lesson.save
      render json: @lesson, status: :created
    else
      render json: @lesson.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /api/v1/lessons/:id
  def update
    if @lesson.update(lesson_params)
      render json: @lesson
    else
      render json: @lesson.errors, status: :unprocessable_entity
    end
  end

  # DELETE /api/v1/lessons/:id
  def destroy
    @lesson.destroy
    head :no_content
  end

  private

  def set_lesson
    @lesson = Lesson.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    render json: { error: "Lesson not found" }, status: :not_found
  end

  def lesson_params
    params.require(:lesson).permit(:title, :description, :duration)
  end
end
