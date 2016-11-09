class ItemType < ActiveRecord::Base
	
	# Relationships
	has_many :items

	# Scopes
	scope :retired, lambda { where.not(:retired_at => nil) }
	scope :not_retired, lambda { where(:retired_at => nil) }
	scope :oldest_first, lambda { order("item_types.created_at ASC") }
	scope :newest_first, lambda { order("item_types.created_at DESC") }

	# Validations
	validates_presence_of :name
	validates_length_of :name, :maximum => 50

	validates_presence_of :description
	validates_length_of :description, :maximum => 255

end
