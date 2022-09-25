class AddTutoringTimeSlotIdToBookedTimeSlot < ActiveRecord::Migration[6.1]
  def change
    add_column :booked_time_slots, :tutoring_time_slot_id, :integer
  end
end
