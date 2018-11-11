class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  helper_method :current_user

  def current_user
    session[:name] ||= nil
  end

  def is_login
    if current_user.nil? || current_user.empty?
      redirect_to login_path
    end
  end

  def welcome
    if current_user.nil? || current_user.empty?
      redirect_to login_path
    else 
      render :welcome
    end
  end
end
