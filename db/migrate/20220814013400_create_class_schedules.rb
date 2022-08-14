class CreateClassSchedules < ActiveRecord::Migration[6.1]
  def change
    create_table :class_schedules do |t|
      t.integer :student_id
      t.integer :class_period_id
      t.integer :subject_id
      t.integer :teacher_id

      t.timestamps
    end
  end
end
