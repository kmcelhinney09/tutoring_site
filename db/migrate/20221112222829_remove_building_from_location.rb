class RemoveBuildingFromLocation < ActiveRecord::Migration[6.1]
  def change
    remove_column :locations, :building, :string
  end
end
