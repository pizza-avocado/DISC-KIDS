# frozen_string_literal: true

class CreateInquiryReplies < ActiveRecord::Migration[5.2]
  def change
    create_table :inquiry_replies do |t|
      t.integer :inquiry_id, null: false
      t.integer :administrator_id, null: false
      t.text :reply_content, null: false

      t.timestamps
    end
  end
end
