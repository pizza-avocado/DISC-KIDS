class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.integer :artist_id, null: false
      t.integer :label_id,  null: false
      t.integer :genre_id,  null: false
      t.string :name,     	index: true
      t.integer :price,     null: false
      t.integer :stock,     null: false
      t.text :jacket_image
      t.string :status,     null: false
      t.string :disctype
      t.timestamps
    end
  end
end
