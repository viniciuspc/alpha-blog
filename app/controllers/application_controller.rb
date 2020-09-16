class ApplicationController < ActionController::Base
  helper_method :current_user, :logged_in?

  def current_user
    # If we have a @current_user will return else will find the user if there is
    # user_id in the session
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def logged_in?
    # return true or false based on current_user
    !!current_user
  end

  def require_user
    if !logged_in?
      flash[:alert] = "You must be logged in to perform that action"
      redirect_to login_path
    end
  end
end
