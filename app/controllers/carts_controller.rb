class CartsController < ApplicationController

  def create
    add_to_cart(params[:product_id])
    redirect_to :back
  end

  def show
    @order = Order.from_cart(cart)
  end

  def destroy
    remove_from_cart(params[:product_id])
    redirect_to :back
  end

  protected
    def add_to_cart(id)
      cart[id] += 1
    end

    def remove_from_cart(id)
      cart.delete(id)
    end
end