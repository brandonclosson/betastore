class CustomersController < ApplicationController
  def new
    @customer = Customer.new
  end

  def create
    @customer = Customer.new(customer_params)

    if @customer.save
      redirect_to root_path, notice: "Welcome #{@customer.first_name} #{@customer.last_name}"
    else
      render 'new'
    end
  end

  def verify
    customer = Customer.verify(params[:token])

    if customer
      redirect_to root_path, notice: "Your account is confirmed"
    else
      redirect_to root_path, alert: 'The verification link is invalid'
    end
  end

  protected

    def customer_params
      params.require(:customer).permit(:first_name, :last_name, :email, :password)
    end
end