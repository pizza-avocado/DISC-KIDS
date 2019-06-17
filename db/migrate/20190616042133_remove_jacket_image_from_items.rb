class RemoveJacketImageFromItems < ActiveRecord::Migration[5.2]
  def change
    remove_column :items, :jacket_image, :text
  end
end
