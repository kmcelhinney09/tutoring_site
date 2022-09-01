class AddSchoolToLocations < ActiveRecord::Migration[6.1]
  def change
    add_column :locations,:school_id,:integer
  end
end
