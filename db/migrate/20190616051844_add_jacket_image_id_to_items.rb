class AddJacketImageIdToItems < ActiveRecord::Migration[5.2]
  def change
    add_column :items, :jacket_image_id, :text
  end
end
