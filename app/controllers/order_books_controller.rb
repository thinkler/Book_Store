class OrderBooksController < ApplicationController
  def create
    @cart = current_cart
    if @cart.order_books.where(book_id: params[:order_book][:book_id].to_i).empty?
      @order_book = @cart.order_books.new(order_books_params)
      @cart.save
      session[:cart_id] = @cart.id
    end
    redirect_to cart_path(@cart)
  end

  def update
    @cart = current_cart
    @order_book = @cart.order_books.find(params[:b_id])
    @order_book.update(quantity: params[:quantity])
    @order_book.save
    redirect_to cart_path(@cart)
  end

  def destroy
    @cart = current_cart
    @order_book = @cart.order_books.find(params[:id])
    @order_book.destroy
    redirect_to cart_path(@cart)
  end

  private

  def order_books_params
    params.require(:order_book).permit(:quantity, :book_id)
  end

end
