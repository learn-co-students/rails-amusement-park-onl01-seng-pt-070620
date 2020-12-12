class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :current_user
  before_action :verify_user

  private

  def verify_user
    redirect_to '/' unless logged_in?
  end

  def logged_in?
    !!current_user
  end

  def current_user
    session[:user_id]
  end
end

