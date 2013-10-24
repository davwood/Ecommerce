class ChargesController < ApplicationController
  def new
    @cart = Cart.find params[:cart_id]
  end

   # def create
   #  # Amount in cents
   #  @amount = 500

   #  customer = Stripe::Customer.create(
   #    :email => 'example@stripe.com',
   #    :card  => params[:stripeToken]
   #  )

   #  charge = Stripe::Charge.create(
   #    :customer    => customer.id,
   #    :amount      => @amount,
   #    :description => 'Rails Stripe customer',
   #    :currency    => 'usd'
   #  )



   #  rescue Stripe::CardError => e
   #  flash[:error] = e.message
   #  redirect_to charges_path
  end

  def create
    @cart = params[]
    @amount = cart.total

    customer = Stripe::Customer.create(
      :email => 'example@stripe.com',
      :card  => params[:stripeToken]
    )

    charge = Stripe::Charge.create(
      :customer    => customer.id,
      :amount      => @amount,
      :description => 'Rails Stripe customer',
      :currency    => 'usd'
    )



    rescue Stripe::CardError => e
    flash[:error] = e.message
    redirect_t

end
