class AddLocationToMerchants < ActiveRecord::Migration[5.2]
  def change
    add_column :merchants, :location, :text
  end
end
