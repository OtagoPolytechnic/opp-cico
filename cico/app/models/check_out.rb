class CheckOut < ActiveRecord::Base
	
	# Relationships
	belongs_to :items
	belongs_to :users

	# Scopes

	# Validations
	validates_presence_of :item_id
	validates_presence_of :user_id
	
end
