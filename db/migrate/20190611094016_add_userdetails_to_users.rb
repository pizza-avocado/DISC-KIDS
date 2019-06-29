class AddUserdetailsToUsers < ActiveRecord::Migration[5.2]

  def change
    add_column :users, :lastname, :string

    add_column :users, :firstname, :string

    add_column :users, :lastname_kana, :string

    add_column :users, :firstname_kana, :string

    add_column :users, :phonenumber, :string

    add_column :users, :postalcode, :string

    add_column :users, :address, :text

  end

end
