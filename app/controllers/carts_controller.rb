class CartsController < ApplicationController
  def show
    @cart = current_cart
    @cart.subtotal
    @cart.save
    @books = current_cart.order_books
  end

  def index
    @carts = Cart.all
  end

  def edit
    @cart = current_cart
  end

  def update
    @cart = current_cart
    @cart.update(cart_params)
    session.clear
    redirect_to root_path
  end

  private 

  def cart_params
    params.require(:cart).permit(:name, :phone, :adress)
  end
end
