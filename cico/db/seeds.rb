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
	[ "Bob", "pass", "Bob@email.com" ],
	[ "Bill", "pass", "Bill@email.com" ],
	[ "Joey", "pass", "Joey@email.com" ],
	[ "Cam", "pass", "Cam@email.com" ]
]

user_list.each do |username, password, email|
	User.create( username: username, password: password, email: email)
end