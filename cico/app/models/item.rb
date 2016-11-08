class Item < ActiveRecord::Base
	
	# Relationships
	has_one :item_type
	has_many :checkouts
	has_many :users, through: :check_outs

	# Scopes
	scope :retired, lambda { where.not(:retired_at => nil) }
	scope :not_retired, lambda { where(:retired_at => nil) }
	scope :oldest_first, lambda { order("items.created_at ASC") }
	scope :newest_first, lambda { order("items.created_at DESC") }

	# Validations
	validates_presence_of :name
	validates_length_of :name, :maximum => 50

	validates_presence_of :price

	validates_presence_of :item_type_id

end
