class AddJacketImageId < ActiveRecord::Migration[5.2]
  def change
  	add_colum :items, :jacket_image_id, :text
  end
end
