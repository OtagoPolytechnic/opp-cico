class CheckOut < ActiveRecord::Base
	
	# Relationships
	belongs_to :item
	belongs_to :user

	# Scopes
	scope :oldest_first, lambda { order("check_outs.created_at ASC") }
	scope :newest_first, lambda { order("check_outs.created_at DESC") }

	# Validations
	validates_presence_of :item_id
	validates_presence_of :user_id
	
end
