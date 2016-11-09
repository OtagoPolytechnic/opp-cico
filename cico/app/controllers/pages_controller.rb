class PagesController < ApplicationController

	# Restricts access to the manage content page
	before_action :confirm_admin, :only => :manage_content

    def my_items
    	@my_items = CheckOut.where(user_id: session[:user_id])
    end

    def manage_content
    end

end
