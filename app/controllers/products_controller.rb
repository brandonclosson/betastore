class ProductsController < ApplicationController

  def index
    @products = Product.order('name')

    for param in %i[search min_price max_price]
      @products = @products.send(param, params[param]) if params[param].present?
    end
  end

  def show
    @product = Product.find(params[:id])
  end
end