class ChangeSchoolToId < ActiveRecord::Migration[6.1]
  def change
    change_column :users, :school, 'integer USING school::integer'
  end
end
