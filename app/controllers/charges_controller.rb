class ChargesController < ApplicationController

  def create

    @amount = 1500
   # Creates a Stripe Customer object, for associating
   # with the charge
   customer = Stripe::Customer.create(
     email: current_user.email,
     card: params[:stripeToken]
   )

   # Where the real magic happens
   charge = Stripe::Charge.create(
     customer: customer.id, # Note -- this is NOT the user_id in your app
     amount: @amount,
     description: "Premium Membership - #{current_user.email}",
     currency: 'usd'
   )

   current_user.update(role: 'premium')
   flash[:notice] = "Thanks for all the money, #{current_user.email}! Feel free to pay me again."
   redirect_to root_path # or wherever

   # Stripe will send back CardErrors, with friendly messages
   # when something goes wrong.
   # This `rescue block` catches and displays those errors.
   rescue Stripe::CardError => e
     flash[:alert] = e.message
     redirect_to new_charge_path
 end

 def new

 end

end
