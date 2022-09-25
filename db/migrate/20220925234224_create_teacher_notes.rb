class CreateTeacherNotes < ActiveRecord::Migration[6.1]
  def change
    create_table :teacher_notes do |t|
      t.integer :teacher_id
      t.integer :tutee_id
      t.text :note

      t.timestamps
    end
  end
end
