class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  
  
  helper_method :current_user_session, :current_user

  private
  def current_user_session
    return @current_user_session if defined?(@current_user_session)
    @current_user_session = UserSession.find
  end

  def current_user
    return @current_user if defined?(@current_user)
    @current_user = current_user_session && current_user_session.record
  end
  
  def user_or_guest
    current_user || OpenStruct.new(id: 0, name: "Guest user")
  end

  def require_user
    unless current_user
      store_location
      redirect_to new_user_session_url, notice: "You must be logged in to access this page"
      return false
    end
  end

  def require_no_user
    if current_user
      redirect_to root_url, notice: "You are already logged in"
      return false
    end
  end

  def store_location
    session[:return_to] = request.url
  end

  def redirect_back_or_default(default, args = {})
    redirect_to(session[:return_to] || default, args)
    session[:return_to] = nil
  end
  
end
