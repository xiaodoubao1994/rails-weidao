class SessionsController < ApplicationController
  def create
    @user = User.find_by(username: params[:name]) || User.find_by(email: params[:name])
    if @user && @user.userpwd == params[:userpwd]
      session[:user_id] = @user.id
      render json: {code: 1, msg: "登录成功", user: @user, session: session[:user_id]}
    else
      render json: {code: 0, msg: "用户名或密码错误"}
    end
  end

  def destroy
    session.delete(:user_id)
    if !session[:user_id]
      render json: {code: 1, msg:"退出成功"}
    else
      render json: {code: 0, msg: "退出失败"}
    end
  end
end
