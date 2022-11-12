class AddSchoolIdToOnlineResoures < ActiveRecord::Migration[6.1]
  def change
    add_column :online_resources, :school_id, :integer
  end
end
