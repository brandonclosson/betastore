module LoginsHelper

  def sign_in(customer)
    remember_token = Customer.new_remember_token
    cookies.permanent[:remember_token] = remember_token
    customer.update_attribute(:remember_token, Customer.digest(remember_token))
    self.current_customer = customer
  end

  def signed_in?
    !current_customer.nil?
  end

  def current_customer=(customer)
    @current_customer = customer
  end

  def current_customer
    remember_token = Customer.digest(cookies[:remember_token])
    @current_customer ||= Customer.find_by(remember_token: remember_token)
  end
end