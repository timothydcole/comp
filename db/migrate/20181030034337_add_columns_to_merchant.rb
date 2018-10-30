class AddColumnsToMerchant < ActiveRecord::Migration[5.2]
  def change
    add_column :customers, :address, :string
    add_column :customers, :phone, :integer
    add_column :customers, :rating, :float
  end
end
