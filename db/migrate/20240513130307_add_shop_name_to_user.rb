class AddShopNameToUser < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :shop_name, :string
  end
end
