class AddStatusToPurchaseAds < ActiveRecord::Migration[5.2]
  def change
    add_column :purchase_ads, :status, :string, default: "new"
  end
end
