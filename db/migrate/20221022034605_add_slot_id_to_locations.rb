class AddSlotIdToLocations < ActiveRecord::Migration[6.1]
  def change
    add_column :locations, :tutoring_time_slot_id, :integer
  end
end
