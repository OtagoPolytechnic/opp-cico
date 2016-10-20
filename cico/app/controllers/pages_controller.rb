class PagesController < ApplicationController
	
	def index
		render('home')
    end

    def my_items
    	render('my_items')
    end

end
