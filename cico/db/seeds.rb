#-------------------------------------------------------------------------------------------------------------------------------------------
# Item Types seed data

itemType_list = [
	[ "Arduino Kit", "Basic kit for embedded systems." ],
	[ "Laptop", "Laptop used for basic programming." ],
	[ "Robotics Kit", "Used in the Robotics class." ]
]

itemType_list.each do |name, description|
	ItemType.create( name: name, description: description)
end

#-------------------------------------------------------------------------------------------------------------------------------------------
# Users seed data - One admin and one users

user_list = [
	[ "Admin", "Admin", "Admin", "admin", "admin", "Admin@email.co.nz", "true" ],
	[ "Bob", "Smith", "BobSmith", "testpassword", "testpassword", "Bob@email.co.nz", "false" ]
]

user_list.each do |first_name, last_name, username, password, password_confirmation, email, admin|
	User.create( first_name: first_name, last_name: last_name, username: username, password: password, password_confirmation: password_confirmation, email: email, admin: admin)
end

#-------------------------------------------------------------------------------------------------------------------------------------------
# Items seed data

item_list = [
	[ "1", "Arduino Kit 1", "100.00", "123456", "Complete Kit." ],
	[ "1", "Arduino Kit 2", "100.00", "223456", "Complete Kit." ],
	[ "1", "Arduino Kit 3", "100.00", "323456", "Complete Kit." ],
	[ "2", "Laptop 1", "300.00", "113456", "Needs updated .NET." ],
	[ "2", "Laptop 2", "300.00", "22456", "Fully functional." ],
	[ "2", "Laptop 3", "300.00", "333456", "Needs Windows updates." ],
	[ "3", "Robotic Kit 1", "150.00", "113456", "Motors need replacing." ],
	[ "3", "Robotic Kit 2", "150.00", "22256", "Complete Kit." ],
	[ "3", "Robotic Kit 3", "150.00", "331456", "Missing wires." ],
]

item_list.each do |item_type_id, name, price, asset_num, notes|
	Item.create( item_type_id: item_type_id, name: name, price: price, asset_num: asset_num, notes: notes)
end