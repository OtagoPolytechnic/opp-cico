itemType_list = [
	[ "Arduino Kit", "Basic kit for embedded systes" ],
	[ "Laptop", "Laptop used for basic programming" ],
	[ "Robotics Kit", "Used in the Robotics class" ]
]

itemType_list.each do |name, description|
	ItemType.create( name: name, description: description)
end

#------------------------------------------------------------------

user_list = [
	[ "Bob", "Smith", "BobSmith", "testpassword", "testpassword", "Bob@email.co.nz", "true"]
]

user_list.each do |first_name, last_name, username, password, password_confirmation, email, admin|
	User.create( first_name: first_name, last_name: last_name, username: username, password: password, password_confirmation: password_confirmation, email: email, admin: admin)
end