class ChargesController < ApplicationController
  def new
  end

  def show
    @charges = Customer.find(params[:id])

  end

  def create
    # Amount in cents
    @amount = params[:course]
    customer = Stripe::Customer.create(
      :email => params[:stripeEmail],
      :source  => params[:stripeToken]
    )

    charge = Stripe::Charge.create(
      :customer    => customer.id,
      :amount      => 500,
      :description => 'Rails Stripe customer',
      :currency    => 'usd'
    )

  rescue Stripe::CardError => e
    flash[:error] = e.message
    redirect_to new_charge_path
  end
end

def customer_params
  params.require(:customer).permit(:username, :last_name, :first_name, :email, :password)
end
