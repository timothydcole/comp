json.extract! sell_ad, :id, :title, :description, :location, :views, :phone, :user_id, :created_at, :updated_at
json.url sell_ad_url(sell_ad, format: :json)
