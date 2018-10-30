class AddViewsToMerchants < ActiveRecord::Migration[5.2]
  def change
    add_column :merchants, :views, :integer, default: 0
    add_column :merchants,[:latitude, :longitude]

  end
end
