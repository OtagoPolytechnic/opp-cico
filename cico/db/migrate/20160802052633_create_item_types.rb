class CreateItemTypes < ActiveRecord::Migration
  
  # Creates the item_types table
  def up
    create_table :item_types do |t|
      t.string :name, :limit => 50, :null => false
      t.text :description, :limit => 255, :null => false
      t.text :notes, :null => true
      t.date :retired_at, :null => true

      t.timestamps null: false
    end
  end

  # Drops the item_types table
  def down
  	drop_table :item_types
  end
  
end
