class CreateBookedTimeSlots < ActiveRecord::Migration[6.1]
  def change
    create_table :booked_time_slots do |t|
      t.integer :tutor_id
      t.integer :tutee_id

      t.timestamps
    end
  end
end
