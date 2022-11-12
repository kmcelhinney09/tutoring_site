class AddDescriptionToOnlineResources < ActiveRecord::Migration[6.1]
  def change
    add_column :online_resources, :description, :text
  end
end
