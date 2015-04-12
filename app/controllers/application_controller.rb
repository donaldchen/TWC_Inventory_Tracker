class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_filter :check_login

  def check_login
  	if not session[:login]
  		flash[:notice] = "Please login to access the application."
  		redirect_to login_path 
  	end
  end
end
