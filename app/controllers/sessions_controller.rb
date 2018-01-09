class SessionsController < ApplicationController
  def create
    @user = User.find_by(username: params[:username]) || User.find_by(email: params[:email])
    if @user && @user.userpwd == params[:userpwd]
      render json: {code: 1, msg: "登录成功"}
      session[:user_id] = @user.id
    else
      render json: {code: 0, mgs: "用户名或密码错误"}
    end
  end

  def destroy
    session.delete(:user_id)
  end
end
