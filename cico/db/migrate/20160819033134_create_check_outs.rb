class CreateCheckOuts < ActiveRecord::Migration
  
  # Creates the check_outs table
  def up
    create_table :check_outs do |t|
      t.integer :item_id, :null => false
      t.integer :user_id, :null => false
      t.date :returned_at, :null => true

      t.timestamps null: false
    end
  end

  # Drops the check_outs table
  def down
  	drop_table :check_outs
  end

end
