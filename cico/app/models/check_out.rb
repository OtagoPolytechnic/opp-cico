class CheckOut < ActiveRecord::Base
	
	# Relationships
	belongs_to :item
	belongs_to :user

	# Scopes

	# Validations
	validates_presence_of :item_id
	validates_presence_of :user_id
	
end
