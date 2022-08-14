class CreateLocationSchedules < ActiveRecord::Migration[6.1]
  def change
    create_table :location_schedules do |t|
      t.integer :location_id
      t.datetime :date_start_time
      t.datetime :date_end_time

      t.timestamps
    end
  end
end
