class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :username, :limit => 30, :null => false
      t.string :password, :limit => 30, :null => false
      t.string :email, :limit => 50, :null => false

      t.timestamps null: false
    end
  end
end
