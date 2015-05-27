class BooksController < ApplicationController

  before_action :find_category
  before_action :find_book, except: [:create, :new]

  def show
  end

  def new
    @book = Book.new()
  end

  def create
    @book = @category.books.new(book_params)
    if @book.save
      redirect_to @category
    else
      render 'new'
    end
  end

  def edit
  end

  def update
    if @book.update(book_params)
      redirect_to @category
    else
      render 'edit'
    end
  end

  def destroy
    @book.destroy
    redirect_to @category
  end

  private 

  def book_params
    params.require(:book).permit(:title, :price, :count, :year, :isnb, :about)
  end

  def find_book
    @book = @category.books.find(params[:id])
  end

  def find_category
    @category = Category.find(params[:category_id])
  end

end
