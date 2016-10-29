class ApplicationController < ActionController::Base
  
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  # Checked logged in
  before_action :confirm_logged_in

  private

  def confirm_logged_in
    unless session[:user_id]
      flash[:notice] = "Please log in."
      redirect_to(:controller => 'access', :action => 'login')
      return false # halts the before_action
    else
      return true
    end
  end

  def confirm_admin
    if (session[:admin] != true)
      flash[:notice] = "Sorry you are not an admin"
      redirect_to(:controller => 'pages', :action => 'index')
      return false # halts the before_action
    else
      return true
    end
  end

end
