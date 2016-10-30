class User < ActiveRecord::Base

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

	validates_length_of :password, :maximum => 25

	#I would normally put this at the top but the error appears in the list nicer
	# Used for the bcrypt gem
	has_secure_password

	validates_presence_of :password_confirmation
	validates_length_of :password_confirmation, :maximum => 25

	validates_presence_of :email
	validates_length_of :email, :maximum => 50
	validates_format_of :email, :with => EMAIL_REGEX
	
end
