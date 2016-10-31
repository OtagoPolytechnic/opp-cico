class Item < ActiveRecord::Base
	
	has_one :item_type
	has_many :checkouts

	# Validations
	validates_presence_of :name
	validates_length_of :name, :maximum => 50

	validates_presence_of :price

	validates_presence_of :item_type_id

end
