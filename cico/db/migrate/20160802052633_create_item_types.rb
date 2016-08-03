class CreateItemTypes < ActiveRecord::Migration
  def up
    create_table :item_types do |t|
      t.string :name, :limit => 50, :null => false
      t.text :description, :null => false
      t.text :notes, :null => true
      t.date :retired_at, :null => true

      t.timestamps null: false
    end
  end

  def down
  	drop_table :item_types
  end
end
