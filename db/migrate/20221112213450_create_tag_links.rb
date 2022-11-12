class CreateTagLinks < ActiveRecord::Migration[6.1]
  def change
    create_table :tag_links do |t|
      t.integer :online_resource_id
      t.integer :tag_id

      t.timestamps
    end
  end
end
