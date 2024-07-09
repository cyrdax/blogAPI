class UsersController < ApplicationController
  before_action :set_user, only: [:show, :update, :destroy]

  # GET /users
  def index
    @users = User.all
    render json: @users, each_serializer: UserSerializer, include: ['posts.links']
  end

  # GET /users/:id
  def show
    render json: @user, serializer: UserSerializer, include: ['posts.links']
  end

  # POST /users
  def create
    @user = User.new(user_params)
    if @user.save
      render json: @user, serializer: UserSerializer, status: :created
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /users/:id
  def update
    if @user.update(user_params)
      render json: @user, serializer: UserSerializer
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  # DELETE /users/:id
  def destroy
    @user.destroy
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:name, :email, :picture, :bio)
  end
end
