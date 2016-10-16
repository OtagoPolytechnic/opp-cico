class CreateUsers < ActiveRecord::Migration

  def up
    create_table :users do |t|
      t.string :first_name, :limit => 25, :null => false
      t.string :last_name, :limit => 25, :null => false
      t.string :username, :limit => 25, :null => false
      t.string :password_digest, :null => false
      t.string :email, :limit => 50, :null => false

      t.timestamps null: false
    end
  end

  def down
  	drop_table :users
  end

end