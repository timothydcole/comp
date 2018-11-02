class CreateJobs < ActiveRecord::Migration[5.2]
  def change
    create_table :jobs do |t|
      t.integer :merchant_id
      t.integer :customer_id
      t.integer :ad_id
      t.string :status

      t.timestamps
    end
  end
end
