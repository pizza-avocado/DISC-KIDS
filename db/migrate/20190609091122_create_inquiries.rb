class CreateInquiries < ActiveRecord::Migration[5.2]
  def change
    create_table :inquiries do |t|

      t.string :email,			null: false
      t.text :inquiry_content,	null: false

      t.timestamps
    end
  end
end
