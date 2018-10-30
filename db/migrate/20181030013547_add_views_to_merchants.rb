class AddViewsToMerchants < ActiveRecord::Migration[5.2]
  def change
    add_column :merchants, :views, :integer, default: 0
  end
end
