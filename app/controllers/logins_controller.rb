class LoginsController < ApplicationController

  skip_before_action :require_login

  def new
    redirect_to root_path if signed_in?
  end

  def create
    customer = Customer.find_by(email: params[:login][:email].downcase)
    if customer && customer.authenticate(params[:login][:password])
      sign_in customer
      flash.now[:info] = "Welcome back to Betastore, #{customer.first_name}."
      redirect_to root_path
    else
      flash.now[:danger] = "Invalid email/password combination!"
      render 'new'
    end
  end

  def destroy
    sign_out
    redirect_to welcome_path
  end
end