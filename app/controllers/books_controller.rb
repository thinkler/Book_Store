class BooksController < ApplicationController

  before_action :find_category, except: [:author_select_list, :add_author, :delete_author]
  before_action :find_book, except: [:create, :new, :author_select_list, :add_author, :delete_author]

  add_breadcrumb "Home", :root_path
  
  def show
    add_breadcrumb "#{@category.title}", category_path(@category)
    add_breadcrumb "#{@book.title}"
    @authors = @book.authors.all
    @order_book = current_cart.order_books.new
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

  def author_select_list
    @authors = Author.ransack(name_cont: params[:author_name]).result
    @authors = @authors.limit(20)
  end

  def add_author
    author_id = params[:id]
    @book = Book.find(params[:book_id])
    if @book.authors.where(id: author_id).empty?
      @book.authors << Author.find(author_id)
    end
    redirect_to category_book_path(@book.category.id, @book)
  end

  def delete_author
    author_id = params[:author_id]
    @book = Book.find(params[:id])
    @book.authors.delete(author_id)
    redirect_to book_path(params[:id])
  end

  private 

  def book_params
    params.require(:book).permit(:title, :price, :count, :year, :isnb, :about, :book_img)
  end

  def find_book
    @book = @category.books.find(params[:id])
  end

  def find_category
    @category = Category.find(params[:category_id])
  end

end
