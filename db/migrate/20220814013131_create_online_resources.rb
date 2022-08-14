class CreateOnlineResources < ActiveRecord::Migration[6.1]
  def change
    create_table :online_resources do |t|
      t.string :title
      t.text :url
      t.integer :owner_id
      t.integer :cubject_id
      t.string :tag

      t.timestamps
    end
  end
end
