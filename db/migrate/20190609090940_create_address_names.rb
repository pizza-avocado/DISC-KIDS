class CreateAddressNames < ActiveRecord::Migration[5.2]
  def change
    create_table :address_names do |t|

      t.integer :user_id,		null: false
      t.string :address_name,	null: false

      t.timestamps
    end
  end
end
