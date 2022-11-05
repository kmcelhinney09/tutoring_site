class RemoveOpenStatusFromBookedTimeSlot < ActiveRecord::Migration[6.1]
  def change
    remove_column :booked_time_slots, :open_status
  end
end
