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
	[ "Bob", "Smith", "BobSmith", "testpassword", "Bob@email.com" ]
]

user_list.each do |first_name, last_name, username, password, email|
	User.create( first_name: first_name, last_name: last_name, username: username, password: password, email: email)
end