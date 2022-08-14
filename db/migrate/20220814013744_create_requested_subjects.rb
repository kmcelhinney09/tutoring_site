class CreateRequestedSubjects < ActiveRecord::Migration[6.1]
  def change
    create_table :requested_subjects do |t|
      t.integer :tutee_id
      t.integer :subject_id

      t.timestamps
    end
  end
end
