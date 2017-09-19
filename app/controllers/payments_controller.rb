class PaymentsController < ApplicationController
  def create
    token = params[:stripeToken]
    @product = Product.find(params[:product_id])
    @user = current_user
    # Create the charge on Stripe's servers - this will charge the user's card
    begin
      charge = Stripe::Charge.create(
        amount: (@product.price * 100), # amount in cents, again
        currency: "usd",
        source: token,
        description: params[:stripeEmail],
      )
    
    
  if charge.paid
    order.create(product_id: @product.id, user_id: @user.id, total: @product.price, created_at: Time.now)
  end
    rescue Stripe::CardError => e
      # The card has been declined
      body = e.json_body
      err = body[:error]
      flash[:error] = "There was an error processing your payment, please try again: #{err[:message]}"
    end
  
  redirect_to product_path(@product), notice: 'Purchase complete. Thank you for your Business'
  end
    
end
