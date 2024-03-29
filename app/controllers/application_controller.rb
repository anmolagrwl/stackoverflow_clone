class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  helper_method [:current_user, :logged_in?]

  def login(user)
    session[:user_id] = user.id
  end

  def current_user
  	current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def logged_in?
  	!current_user.nil?
  end

  def auth
    redirect_to login_url, alert: 'You must login to access that page' unless logged_in?
  end

end
