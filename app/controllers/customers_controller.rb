class CustomersController < ApplicationController

  def new
    @customer = Customer.new
  end

  def create
    @customer = Customer.new(customer_params)

    if @customer.save
      flash[:info] = "Welcome, #{@customer.first_name} #{@customer.last_name}. Check your email for account confirmation."
      redirect_to root_path
    else
      render 'new'
    end
  end

  def edit
    @customer = Customer.find(params[:id])
  end

  def verify
    @customer = Customer.verify(params[:token])

    if @customer
      sign_in @customer
      flash[:success] = "Your account has been confirmed."
      redirect_to root_path
    else
      flash[:danger] = "The verification link is invalid."
      redirect_to root_path
    end
  end

  protected

    def customer_params
      params.require(:customer).permit(:first_name, :last_name, :email, :password, :password_confirmation)
    end
end