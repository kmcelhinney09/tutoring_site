class ChangeCubjectIdInOnlineResources < ActiveRecord::Migration[6.1]
  def change
    rename_column :online_resources, :cubject_id, :subject_id
  end
end
