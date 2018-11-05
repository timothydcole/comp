class CreateSellAds < ActiveRecord::Migration[5.2]
  def change
    create_table :sell_ads do |t|
      t.string :title
      t.text :description
      t.text :location
      t.integer :views
      t.integer :phone
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
