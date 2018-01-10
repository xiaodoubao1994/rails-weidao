class UsersController < ApplicationController
  before_action :set_user, only: [:show, :update, :destroy]

  # GET /users
  def index
    @users = User.all

    render json: @users
  end

  # GET /users/1
  def show
    render json: @user
  end

  # POST /users
  def create
    @user = User.new(user_params)

    if @user.save
      # render json: @user, status: :created, location: @user
      render json: {code: 1, msg: "注册成功"}
    else
      # render json: @user.errors, status: :unprocessable_entity
      render json: {code: 0, msg: "注册失败"}
    end
  end

  # PATCH/PUT /users/1
  def update
    if @user.update(user_params)
      render json: @user
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  # DELETE /users/1
  def destroy
    @user.destroy
  end

  def get_user 
    @count = User.get_by(params[:type], params[:value])
    if @count.length > 0
      render json: {code: 1, msg: "已存在"}
    else
      render json: {code: 0, msg: "可以注册"}
    end 
  end



  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def user_params
      params.require(:user).permit(:username, :userpwd, :email)
    end
end
