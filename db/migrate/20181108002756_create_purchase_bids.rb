class CreatePurchaseBids < ActiveRecord::Migration[5.2]
  def change
    create_table :purchase_bids do |t|
      t.references :user, foreign_key: true
      t.references :buy_ad, foreign_key: true
      t.float :price

      t.timestamps
    end
  end
end
