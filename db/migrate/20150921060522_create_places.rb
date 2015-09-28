class CreatePlaces < ActiveRecord::Migration
  def change
    create_table :places do |t|
      t.string :placename ,presence: true,length: { minimum: 4 }
      t.integer :days, presence: true 
      t.integer :nights, presence: true
      t.string :packagename,presence: true
      t.string :category, presence: true
      t.string :facility,presence: true
      t.integer :price, presence: true
      t.timestamps null: false
    end
    add_index :places, :placename
  end
end
