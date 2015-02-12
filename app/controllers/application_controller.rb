class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  helper_method :current_user, :logged_in?

  private
  def log_in(user)
    session[:token] = user.reset_session_token!
  end

  def log_out(user)
    user.reset_session_token!
    session[:token] = nil
  end

  def current_user
    @current_user ||= User.find_by(session_token: session[:token])
  end

  def logged_in?
    !!current_user
  end

  def redirect_logged_in
    redirect_to user_url(current_user) if logged_in?
  end

  def require_login
    redirect_to new_session_url unless logged_in?
  end
end
