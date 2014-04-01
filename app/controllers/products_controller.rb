class ProductsController < ApplicationController
  
  def index
    @product_names = Product.order('name')
  end

end