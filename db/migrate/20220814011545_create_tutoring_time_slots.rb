class CreateTutoringTimeSlots < ActiveRecord::Migration[6.1]
  def change
    create_table :tutoring_time_slots do |t|
      t.integer :created_by
      t.integer :tutor_capacity
      t.integer :tutee_capacity
      t.boolean :booked_status
      t.integer :location_id
      t.datetime :date_start_time
      t.datetime :date_end_time

      t.timestamps
    end
  end
end
