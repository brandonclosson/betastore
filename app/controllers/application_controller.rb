class ApplicationController < ActionController::Base
  include LoginsHelper
  protect_from_forgery with: :exception
  add_flash_types :success, :info, :warning, :danger
  before_action :require_login
  helper_method :require_login, :signed_in?, :current_customer,
                :cookies, :cart

  def cart
    session[:cart] ||= Hash.new(0)
  end
end
