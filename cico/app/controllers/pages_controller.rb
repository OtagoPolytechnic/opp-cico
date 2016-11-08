class PagesController < ApplicationController

    def my_items
    	@my_items = CheckOut.where(user_id: session[:user_id])
    end

    def manage_content
    end

end
