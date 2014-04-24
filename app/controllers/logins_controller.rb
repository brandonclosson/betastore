class LoginsController < ApplicationController

  def new
    redirect_to root_path if signed_in?
  end

  def create
    customer = Customer.find_by(email: params[:login][:email].downcase)
    if customer && customer.authenticate(params[:login][:password])
      sign_in customer
      flash[:info] = "Welcome back to Betastore, #{customer.first_name}."
      redirect_to root_path
    else
      flash.now[:error] = "Invalid email/password combination!"
      render 'new'
    end
  end
end