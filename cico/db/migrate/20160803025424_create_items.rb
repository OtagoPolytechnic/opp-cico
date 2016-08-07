class CreateItems < ActiveRecord::Migration
  
  def up
    create_table :items do |t|
      t.integer :item_type_id, :null => false
      t.string :name, :limit => 50, :null => false
      t.decimal :price, :precision => 8, :scale => 2, :null => false
      t.integer :asset_num, :null => true
      t.text :notes, :null => true
      t.date :retired_at, :null => true

      t.timestamps null: false
    end
    add_index("items", "item_type_id")
  end

  def down
    drop_table :items
  end

end
