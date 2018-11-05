class CreatePurchaseAds < ActiveRecord::Migration[5.2]
  def change
    create_table :purchase_ads do |t|
      t.references :user, foreign_key: true
      t.references :sell_ad, foreign_key: true

      t.timestamps
    end
  end
end
