class AuthorsController < ApplicationController

  before_action :find_author, except: [:index, :new, :create, :book_select_list, :add_book]

  before_action :check_admin

  add_breadcrumb "Home", :root_path  
  add_breadcrumb "Authors", :authors_path  

  def index
    @authors = Author.all
  end

  def show
    add_breadcrumb "#{@author.name}"
    @books = @author.books.all
    @q = @books.ransack(params[:q])
    @books = @q.result.paginate(page: params[:page], per_page: 10)
    @order_book = current_cart.order_books.new
  end

  def new
    @author = Author.new
  end

  def create
    @author = Author.new(author_params)
    if @author.save
      flash[:success] = "Created"
      redirect_to @author
    else
      flash[:error] = "Validations error"
      render 'new'
    end
  end

  def edit
  end

  def update
    if @author.update(author_params)
      flash[:success] = "Updated"
      redirect_to @author
    else
      flash[:error] = "Validations error"
      render 'edit'
    end
  end

  def destroy
    @author.destroy
    flash[:success] = "Deleted"
    redirect_to authors_path
  end

  def book_select_list
    add_breadcrumb "Select list" 
    @books = Book.ransack(title_cont: params[:book_title]).result
    @books = @books.limit(20)
  end

  def add_book
    book_id = params[:id]
    @author = Author.find(params[:author_id])
    if @author.books.where(id: book_id).empty?
      @author.books << Book.find(book_id)
    end
    flash[:success] = "Book added"
    redirect_to author_path(@author)
  end

  def delete_book
    book_id = params[:book_id]
    @author = Author.find(params[:id])
    @author.books.delete(book_id)
    flash[:success] = "Book deleted"
    redirect_to author_path(params[:id])
  end

  private

  def find_author
    @author = Author.find(params[:id])
  end

  def author_params
     params.require(:author).permit(:name, :about, :photo)
  end

end
