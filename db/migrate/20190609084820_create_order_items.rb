class CreateOrderItems < ActiveRecord::Migration[5.2]
  def change
    create_table :order_items do |t|

      t.string :item_id,			null: false
      t.string :order_id,			null: false
      t.integer :purchaced_price,	null: false
      t.integer :quantity,			null: false,  default:1

      t.timestamps
    end
  end
end
