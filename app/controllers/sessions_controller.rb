class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by_phone_number(params[:phone_number])

    if user && user.authenticate(params[:password])
      if verify_rucaptcha?(@user)
        session[:user_id] = user.id
        redirect_to books_path, notice: "Logged in!"
      else
        flash.now.alert = "验证码不正确"
        render "new"
      end
    else
      flash.now.alert = "手机号或密码不正确"
      render "new"
    end

  end

  def destroy
    session[:user_id] = nil
    redirect_to new_session_path, notice: "Logged out!"
  end
end
