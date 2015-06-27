class StaticPagesController < ApplicationController

  add_breadcrumb "Home", :root_path

  def home
    @q = Book.ransack(params[:q])
    @books = @q.result.paginate(page: params[:page], per_page: 10).order('created_at DESC')
    @order_book = current_cart.order_books.new
  end

  def test
    @category = Category.new
    @categories = Category.all
  end

end
