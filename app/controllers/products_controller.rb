class ProductsController < ApplicationController

  def index
    redirect_to welcome_path if !signed_in?
    @products = Product.all

    if params[:q].present?
      @products = @products.search(params[:q])
    end
  end

  def show
    @product = Product.find(params[:id])
  end
end