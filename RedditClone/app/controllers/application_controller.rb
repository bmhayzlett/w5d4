class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  helper_method :current_user

  def current_user
    @current_user ||= User.find_by_session_token(session[:session_token])
  end

  def login_user!(user)
    user.reset_session_token!
    session[:session_token] = user.session_token
  end

  def logout_user!(user)
    user.reset_session_token!
    session[:session_token] = nil
  end

  def require_login
    redirect_to new_session_url unless current_user
  end

  def require_logout
    redirect_to user_url(current_user) if current_user
  end

  def require_moderator
    current_user.id == current_sub.id
  end

  def current_sub
    @sub ||= Sub.find_by_id(params[:id])
  end

end
