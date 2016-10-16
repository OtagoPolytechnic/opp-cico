class User < ActiveRecord::Base

	# Used for the bcrypt gem
	has_secure_password

	has_many :check_outs

	# Validatons
	EMAIL_REGEX = /\A[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,4}\Z/i

	validates_presence_of :first_name
	validates_length_of :first_name, :maximum => 25

	validates_presence_of :last_name
	validates_length_of :last_name, :maximum => 25

	validates_presence_of :username
	validates_length_of :username, :within => 5..25
	validates_uniqueness_of :username

	validates_presence_of :password
	validates_length_of :password, :maximum => 25

	validates_presence_of :email
	validates_length_of :email, :maximum => 50
	validates_format_of :email, :with => EMAIL_REGEX
end
