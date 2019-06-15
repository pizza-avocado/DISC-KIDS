# frozen_string_literal: true

class AddJacketImageToJacketImageIdOnItems < ActiveRecord::Migration[5.2]
  def change
    rename_column :items, :jacket_image, :jacket_image_id
  end
end
