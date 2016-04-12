class SessionsController < ApplicationController
  before_filter :not_authorized, only: [:new, :create]

  def new
  end

  def create
    user = User.find_by_email(signin_params[:email])
    if user && user.authenticate(signin_params[:password])
      session[:user_id] = user.id

      if signin_params[:remember_me]
        cookies[:user_id] = { value: user.id, expires: 1.day.from_now }
      end

      redirect_to '/'
    else
      flash[:error] = "You've entered invalid credentials!"
      redirect_to '/signin'
    end
  end

  def destroy
    session[:user_id] = nil
    cookies[:user_id] = nil
    redirect_to '/'
  end

  private

  def signin_params
    params.require(:session).permit(:email, :password, :remember_me)
  end
end
