class PostsController < ApplicationController
  before_action :set_user, only: [:user_index, :create]
  before_action :set_post, only: [:show, :update, :destroy]

  # GET /users/:user_id/posts
  def user_index
    @posts = @user.posts
    render json: @posts
  end

  # GET /posts
  def index
    @posts = Post.all
    render json: @posts
  end

  # GET /posts/:id
  def show
    render json: @post
  end

  # POST /users/:user_id/posts
  def create
    @post = @user.posts.new(post_params)
    if @post.save
      render json: @post, status: :created
    else
      render json: @post.errors, status: :unprocessable_entity
    end
  end

  def update
    if @post.update(post_params)
      render json: @post
    else
      render json: @post.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @post.destroy
  end

  private

  def set_user
    @user = User.find(params[:user_id])
  end

  def set_post
    @post = Post.find(params[:id])
  end

  def post_params
    params.require(:post).permit(:subject, :post_text, :picture)
  end
end
