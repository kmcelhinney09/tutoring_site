class RemoveTagsFromOnlineResources < ActiveRecord::Migration[6.1]
  def change
    remove_column :online_resources, :tag
  end
end
