class ChargesController < ApplicationController
  def new
  end

  def create

    if params[:sell_ad_id] != nil
      #lookup the product
      @sell_ad = SellAd.find(params[:sell_ad_id]) ##add this
      @store = {
        :user_id => current_user.id,
        :sell_ad_id => params[:sell_ad_id]
      }

    customer = Stripe::Customer.create(
      :email => params[:stripeEmail],
      :source  => params[:stripeToken]
    )

    charge = Stripe::Charge.create(
      :customer    => customer.id,
      :amount      => @sell_ad.price.to_i, ##change to this
      :description => @sell_ad.title, #add this
      :description => 'Rails Stripe customer',
      :currency    => 'aud'
    )

    @purchase_ad = PurchaseAd.new(@store)
    @purchase_ad.save

    PurchaseMailer.with(user: current_user, product: @sell_ad).new_purchase.deliver_now

    #
  else
    @bid = Bid.find(params[:bid_id])
    @buy_ad = BuyAd.find(params[:buy_ad_id]) ##add this
    @buy_ad.price = @bid.price
    @store = {
      :user_id => current_user.id,
      :buy_ad_id => params[:buy_ad_id],
      :offer_user_id => params[:offer_user_id]
    }

  customer = Stripe::Customer.create(
    :email => params[:stripeEmail],
    :source  => params[:stripeToken]
  )

  charge = Stripe::Charge.create(
    :customer    => customer,
    :amount      => @bid.price.to_i, ##change to this
    :description => @bid.message, #add this
    :description => 'Rails Stripe customer',
    :currency    => 'aud'
  )

  @purchase_bid = PurchaseBid.new(@store)
  @purchase_bid.save

  PurchaseMailer.with(user: current_user, product: @buy_ad).new_purchase.deliver_now


  end
end
end
