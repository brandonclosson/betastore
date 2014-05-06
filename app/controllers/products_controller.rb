class ProductsController < ApplicationController
  skip_before_action :require_login

  def index
    @products = Product.order('name')
    @order = Order.from_cart(cart)

    for param in %i[search min_price max_price]
      @products = @products.send(param, params[param]) if params[param].present?
    end

    respond_to do |format|
      format.html {}
      format.json { render json: @products }
    end
  end

  def show
    @product = Product.find(params[:id])
  end
end