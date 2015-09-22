class CreatePlaces < ActiveRecord::Migration
  def change
    create_table :places do |t|
      t.string :placename
      t.integer :daycharge
      t.integer :nightcharge

      t.timestamps null: false
    end
    add_index :places, :placename
  end
end
