class ChargesController < ApplicationController
  def new
  end

  def create
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



    rescue Stripe::CardError => e
      flash[:error] = e.message
      redirect_to new_charge_path
    end

end
