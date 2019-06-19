class AddPostalcodeToOrders < ActiveRecord::Migration[5.2]
  def change
    add_column :orders, :postalcode, :string
  end
end
