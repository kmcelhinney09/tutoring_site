class CreateLocations < ActiveRecord::Migration[6.1]
  def change
    create_table :locations do |t|
      t.string :name
      t.string :building
      t.integer :capacity

      t.timestamps
    end
  end
end
