class CartsController < ApplicationController
  def show
    if !admin_signed_in?
      @cart = current_cart
      @cart.subtotal
      @cart.save
    else
      @cart = Cart.find(params[:id])
    end
    @books = @cart.order_books
  end

  def index
    @carts = Cart.all
  end

  def edit
    @cart = current_cart
  end

  def update
    unless params[:cart][:status]
      @cart = current_cart
      @cart.update(cart_params)
      @cart.order_books.each do |ob|
        ob.book.plus_rating
      end
      redirect_to root_path
      session.clear
    else
      @cart = Cart.find(params[:id])
      @cart.update(cart_params)
      redirect_to carts_path
    end

  end

  def destroy
    @cart = Cart.find(params[:id])
    @cart.destroy
    redirect_to carts_path
  end

  private 

  def cart_params
    params.require(:cart).permit(:name, :phone, :adress, :status)
  end
end
