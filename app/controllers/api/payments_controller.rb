class Api::PaymentsController < ApplicationController
  def create
    # 1. Create a Customer with Stripe API
    customer = Stripe::Customer.create(
      email: params[:payment][:email],
      source: params['payment'][:stripeToken]
    )
    
    
    # 2. Create a Charge and charge customer from #1. line 5-7
    charge = Stripe::Charge.create(
      customer: customer.id,
      amount: params['payment'][:amount],
      currency: params['payment'][:currency],
      description: 'Payment for Quiz' # Is this really required?
    )
    
    binding.pry
    # 3. Respond with charged status (paid)
    render json: { paid: charge.paid }, status: :created # :created is rails equivalent of 201

  end
end
