class PurchaseAd < ApplicationRecord
  belongs_to :user
  belongs_to :sell_ad
end
