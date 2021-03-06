# frozen_string_literal: true

class CreateArtists < ActiveRecord::Migration[5.2]
  def change
    create_table :artists do |t|
      t.string :artist, null: false

      t.timestamps
    end
  end
end
