class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

## method to reference current user via session stored in cookie
  helper_method :current_user
  helper_method :logged_in?
  helper_method :log_in
  helper_method :current_twin

  # logs in new current user.
  def log_in(user)
    session[:user_id] = user.id
  end

  # checks if current user is logged in, if not returns false
  def logged_in?
    !current_user.nil?
  end

  def current_twin
    current_user.twins.find(params[:id])
  end



  private

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

end
