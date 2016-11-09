class ApplicationController < ActionController::Base
  
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  # Checked logged in
  # This is in the parent application controller because to access
  # any part of the web app the user should be logged in.
  before_action :confirm_logged_in

  private

  # Confirms if the user is logged in
  def confirm_logged_in
    unless session[:user_id]
      flash[:notice] = "Please log in."
      redirect_to(:controller => 'access', :action => 'login')
      
      return false # Halts the before_action
    else
      return true
    end
  end

  # Confirms if the user is an admin.
  # Some pages require admin privileges to access them
  def confirm_admin
    unless session[:admin]
      flash[:notice] = "Access Denied"
      redirect_to(:controller => 'pages', :action => 'my_items')
      
      return false # Halts the before_action
    else
      return true
    end
  end

end
