class PurchaseBid < ApplicationRecord
  belongs_to :user
  belongs_to :buy_ad
end
