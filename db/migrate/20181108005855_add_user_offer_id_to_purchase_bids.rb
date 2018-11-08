class AddUserOfferIdToPurchaseBids < ActiveRecord::Migration[5.2]
  def change
    add_column :purchase_bids, :offer_user_id, :integer
  end
end
