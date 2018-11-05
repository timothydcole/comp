class AddPriceToAds < ActiveRecord::Migration[5.2]
  def change
    add_column :buy_ads, :price, :integer
    add_column :sell_ads, :price, :integer
  end
end
