class CreateItemTypes < ActiveRecord::Migration
  def change
    create_table :item_types do |t|
      t.string :name
      t.text :description
      t.text :notes
      t.date :retire_date

      t.timestamps null: false
    end
  end
end
