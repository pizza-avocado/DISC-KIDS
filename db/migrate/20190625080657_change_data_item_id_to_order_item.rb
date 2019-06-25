class ChangeDataItemIdToOrderItem < ActiveRecord::Migration[5.2]
  def change
  	change_column :order_items, :item_id, :integer
  end
end
