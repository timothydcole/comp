class AddPriceToMerchants < ActiveRecord::Migration[5.2]
  def change
    add_column :merchants, :price, :float
  end
end
