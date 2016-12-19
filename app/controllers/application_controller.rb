class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  def require_login
  if session[:user_id] == nil
    redirect_to '/'
    flash[:msg] = 'You must be logged in to see this page!'
  end
  end
  def current_user
    User.find(session[:user_id]) if session[:user_id]
  end
  helper_method :current_user
end
