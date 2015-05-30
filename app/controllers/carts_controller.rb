class CartsController < ApplicationController
  def show
    @cart = current_cart
    @cart.subtotal
    @books = current_cart.order_books
  end
end
