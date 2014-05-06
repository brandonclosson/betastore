class CustomersController < ApplicationController

  skip_before_action :require_login

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
    @customer = current_customer
    @cc = @customer.credit_cards.build
  end

  def update
    password_changed = false
    @customer = current_customer

    if params = edit_customer_params
      params.delete(:password) if params[:password].blank?
      params.delete(:password_confirmation) if params[:password].blank? and params[:password_confirmation].blank?

      if params[:credit_cards_attributes]
        @customer.update_attributes(edit_customer_params)
        @customer.save
        render 'edit'
      else
        params.delete(:credit_cards_attributes)
        @customer.update_attributes(edit_customer_params)
        render 'edit'
      end
    end
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

    def edit_customer_params
      params.require(:customer).permit(:first_name,:last_name, :email, :password, :password_confirmation,
                                credit_cards_attributes: [:card_number, :expiration_date])
    end
end