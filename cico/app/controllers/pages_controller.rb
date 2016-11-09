class PagesController < ApplicationController

	# Restricts access to the manage content page
	before_action :confirm_admin, :only => :manage_content

	# Display items that the current user has checked out
    def my_items
    	@my_items = CheckOut.where(user_id: session[:user_id])
    end

    # A manage page with links for admins
    def manage_content
    end

end
