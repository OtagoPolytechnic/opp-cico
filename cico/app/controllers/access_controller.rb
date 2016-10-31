class AccessController < ApplicationController

  layout 'login'

  before_action :confirm_logged_in, :except => [:login, :attempt_login, :logout]
  
  def login
  	# login form
  end

  def attempt_login
    if params[:username].present? && params[:password].present?
      found_user = User.where(:username => params[:username]).first
      if found_user
        authorized_user = found_user.authenticate(params[:password])
      end
    end
    if authorized_user
      # mark user as logged in
      session[:user_id] = authorized_user.id
      session[:username] = authorized_user.username
      session[:admin] = authorized_user.admin
      flash[:success] = "You are now logged in."
      redirect_to(:controller => 'pages' ,:action => 'my_items')
    else
      flash[:error] = "Invalid username/password combination."
      redirect_to(:action => 'login')
    end
  end

  def logout
    # mark user as logged out
    session[:user_id] = nil
    session[:username] = nil
    session[:admin] = nil
    flash[:success] = "Logged out."
    redirect_to(:action => "login")
  end

end
