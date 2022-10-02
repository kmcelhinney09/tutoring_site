class ChangeSchoolToSchoolId < ActiveRecord::Migration[6.1]
  def change
    rename_column :users, :school, :school_id
    
  end
end
