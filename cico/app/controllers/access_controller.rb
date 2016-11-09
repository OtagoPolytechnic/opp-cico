class AccessController < ApplicationController

  # Use login layout
  layout 'login'

  # Checks to see if the user is already logged in
  before_action :confirm_logged_in, :except => [:login, :attempt_login, :logout]
  
  # Login form
  def login
  end

  # Attempts to login after the form has been submitted
  def attempt_login
    # Checks if username and password params are set
    if params[:username].present? && params[:password].present?
      # Attempts to find user
      found_user = User.where(:username => params[:username]).first
      # Checks if user was found
      if found_user
        # Authenticates user
        authorized_user = found_user.authenticate(params[:password])
      end
    end
      # Checks if the user is authorized
      if authorized_user
        # Sets variables in session
        session[:user_id] = authorized_user.id
        session[:username] = authorized_user.username
        session[:admin] = authorized_user.admin
        # Sets flash message
        flash[:success] = "You are now logged in."
        # Redirects to my_items
        redirect_to(:controller => 'pages' ,:action => 'my_items')
      else
        # Sets flash message
        flash[:error] = "Invalid username/password combination."
        # Redirects back to login page
        redirect_to(:action => 'login')
      end
  end

  # Mark user as logged out
  def logout
    # Remove session details
    session[:user_id] = nil
    session[:username] = nil
    session[:admin] = nil
    # Set flash message
    flash[:success] = "Logged out."
    # Redirect to login page
    redirect_to(:action => "login")
  end

end
