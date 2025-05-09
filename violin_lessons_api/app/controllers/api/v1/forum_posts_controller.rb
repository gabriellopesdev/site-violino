class Api::V1::ForumPostsController < ApplicationController
  before_action :set_forum_post, only: [ :show, :update, :destroy ]

  # GET /forum_posts
  def index
    @forum_posts = ForumPost.all
    render json: @forum_posts
  end

  # GET /forum_posts/:id
  def show
    render json: @forum_post
  end

  # POST /forum_posts
  def create
    @forum_post = ForumPost.new(forum_post_params)
    if @forum_post.save
      render json: @forum_post, status: :created
    else
      render json: @forum_post.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /forum_posts/:id
  def update
    if @forum_post.update(forum_post_params)
      render json: @forum_post
    else
      render json: @forum_post.errors, status: :unprocessable_entity
    end
  end

  # DELETE /forum_posts/:id
  def destroy
    @forum_post.destroy
    head :no_content
  end

  private

  # Callback para definir o forum_post com base no ID
  def set_forum_post
    @forum_post = ForumPost.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    render json: { error: "ForumPost not found" }, status: :not_found
  end

  # Permitir apenas parâmetros permitidos
  def forum_post_params
    params.require(:forum_post).permit(:title, :content, :author_id)
  end
end
