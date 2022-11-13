class AddBuildingIdToLocation < ActiveRecord::Migration[6.1]
  def change
    add_column :locations, :building_id, :integer
  end
end
