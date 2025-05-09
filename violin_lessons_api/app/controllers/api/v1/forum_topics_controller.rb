class Api::V1::ForumTopicsController < ApplicationController
  before_action :set_forum_topic, only: [:show, :update, :destroy]

  # GET /api/v1/forum_topics
  def index
    @forum_topics = ForumTopic.all
    render json: @forum_topics
  end

  # GET /api/v1/forum_topics/:id
  def show
    render json: @forum_topic
  end

  # POST /api/v1/forum_topics
  def create
    @forum_topic = ForumTopic.new(forum_topic_params)
    if @forum_topic.save
      render json: @forum_topic, status: :created
    else
      render json: @forum_topic.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /api/v1/forum_topics/:id
  def update
    if @forum_topic.update(forum_topic_params)
      render json: @forum_topic
    else
      render json: @forum_topic.errors, status: :unprocessable_entity
    end
  end

  # DELETE /api/v1/forum_topics/:id
  def destroy
    @forum_topic.destroy
    head :no_content
  end

  private

  def set_forum_topic
    @forum_topic = ForumTopic.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    render json: { error: 'Forum topic not found' }, status: :not_found
  end

  def forum_topic_params
    params.require(:forum_topic).permit(:title, :content)
  end
end
