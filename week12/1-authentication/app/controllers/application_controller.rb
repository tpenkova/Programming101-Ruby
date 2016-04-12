class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def current_user
    user_id = session[:user_id]

    if user_id.nil? && cookies[:user_id]
      user_id = cookies[:user_id]
      session[:user_id] = user_id
    end

    @current_user ||= User.find_by_id(user_id)
  end

  helper_method :current_user

  def is_signed_in?
    not current_user.nil?
  end

  helper_method :is_signed_in?

  def not_authorized
    redirect_to '/' if current_user
  end
end
