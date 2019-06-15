# frozen_string_literal: true

class CreateReviews < ActiveRecord::Migration[5.2]
  def change
    create_table :reviews do |t|
      t.integer :item_id,  null: false
      t.integer :user_id,  null: false
      t.string :title, null: false
      t.text :body, null: false

      t.timestamps
    end
  end
end
