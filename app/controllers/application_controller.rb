class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead
  # protect_from_forgery with: :exception
  #
    include CanCan::ControllerAdditions
    rescue_from CanCan::AccessDenied do |exception|
      redirect_to root_url, :alert=>exception.message
    end

  private

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  helper_method :current_user

  def authorize
    redirect_to login_url, alert: "目前没有用户登录" if current_user.nil?
  end
end
