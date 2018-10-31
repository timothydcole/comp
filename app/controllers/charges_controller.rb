class ChargesController < ApplicationController

def new
end

def create
    #lookup the product
    @merchant = Merchant.find(params[:user_id]) ##add this

  customer = Stripe::Customer.create(
    :email => params[:stripeEmail],
    :source  => params[:stripeToken]
  )

  charge = Stripe::Charge.create(
    :customer    => customer.id,
    :amount      => @product.price, ##change to this
    :description => @product.title, #add this
    :description => 'Rails Stripe customer',
    :currency    => 'aud'
  )

  ProductMailer.with(user: current_user, product: @product).new_purchase.deliver_now


rescue Stripe::CardError => e
  flash[:error] = e.message
  redirect_to new_charge_path
end




end
