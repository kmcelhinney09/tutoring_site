class AddOpenStatusToTutoringTimeSlot < ActiveRecord::Migration[6.1]
  def change
    add_column :tutoring_time_slots, :open_status, :boolean
  end
end
