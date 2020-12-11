class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :is_admin?

  def current_user
    session[:user_id]
  end

  def logged_in?
    !!current_user
  end

  def require_login
    if !logged_in?
      redirect_to root_path, alert: "You must be logged in."
    end
  end

  def is_admin?
    User.find(current_user).admin == true
  end
end
