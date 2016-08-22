class User < ActiveRecord::Base
	has_many :check_outs
end
