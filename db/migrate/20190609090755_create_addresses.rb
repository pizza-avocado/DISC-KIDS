# frozen_string_literal: true

class CreateAddresses < ActiveRecord::Migration[5.2]
  def change
    create_table :addresses do |t|
      t.integer :user_id, null: false
      t.string :postalcode, null: false
      t.text :address, null: false

      t.timestamps
    end
  end
end
