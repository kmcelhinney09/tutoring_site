class CreateClassPeriods < ActiveRecord::Migration[6.1]
  def change
    create_table :class_periods do |t|
      t.datetime :start_time
      t.datetime :end_time

      t.timestamps
    end
  end
end
