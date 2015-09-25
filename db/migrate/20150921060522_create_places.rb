class CreatePlaces < ActiveRecord::Migration
  def change
    create_table :places do |t|
      t.string :placename ,presence: true,length: { minimum: 4 }
      t.integer :daycharge, presence: true, 
      t.integer :nightcharge, presence: true
      t.timestamps null: false
    end
    add_index :places, :placename
  end
end
