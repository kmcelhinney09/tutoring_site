class RemoveLocationIdFromTutoringTimeSlots < ActiveRecord::Migration[6.1]
  def change
    remove_column :tutoring_time_slots, :location_id, :integer
  end
end
