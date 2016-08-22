class CreateCheckOuts < ActiveRecord::Migration
  
  def up
    create_table :check_outs do |t|
      t.integer :item_id, :null => false
      t.integer :user_id, :null => false
      t.date :returned_at, :null => true

      t.timestamps null: false
    end
  end

  def down
  	drop_table :check_outs
  end

end
