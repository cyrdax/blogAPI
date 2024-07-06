class LinksController < ApplicationController
  before_action :set_post
  before_action :set_link, only: [:show, :update, :destroy]

  def index
    @links = @post.links
    render json: @links
  end

  def show
    render json: @link
  end

  def create
    @link = @post.links.new(link_params)
    if @link.save
      render json: @link, status: :created
    else
      render json: @link.errors, status: :unprocessable_entity
    end
  end

  def update
    if @link.update(link_params)
      render json: @link
    else
      render json: @link.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @link.destroy
  end

  private

  def set_post
    @post = Post.find(params[:post_id])
  end

  def set_link
    @link = @post.links.find(params[:id])
  end

  def link_params
    params.require(:link).permit(:link_name, :link_url, :picture)
  end
end
