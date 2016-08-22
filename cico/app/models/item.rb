class Item < ActiveRecord::Base
	has_one :item_type
	has_many :checkouts
end
