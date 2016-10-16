class ItemType < ActiveRecord::Base
	
	has_many :items

	# Validations
	validates_presence_of :name
	validates_length_of :name, :maximum => 50

	validates_presence_of :description
	validates_length_of :description, :maximum => 255

end
