class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|

      t.integer :user_id,			null: false
      t.string :payment,			null: false
      t.string :address_name,		null: false
      t.string :shipping_address,	null: false
      t.string :order_status,		null: false

      t.timestamps
    end
  end
end
