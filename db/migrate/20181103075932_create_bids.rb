class CreateBids < ActiveRecord::Migration[5.2]
  def change
    create_table :bids do |t|
      t.integer :buy_id
      t.integer :price
      t.text :message

      t.timestamps
    end
  end
end
