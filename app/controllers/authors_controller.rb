class AuthorsController < ApplicationController

  before_action :find_author, except: [:index, :new, :create, :book_select_list, :add_book]

  def index
    @authors = Author.all
  end

  def show
    @books = @author.books.all
    @books = @books.all.paginate(page: params[:page], per_page: 10)
  end

  def new
    @author = Author.new
  end

  def create
    @author = Author.new(author_params)
    if @author.save
      redirect_to @author
    else
      render 'new'
    end
  end

  def edit
  end

  def update
    if @author.update(author_params)
      redirect_to @author
    else
      render 'edit'
    end
  end

  def destroy
    @author.destroy
    redirect_to authors_path
  end

  def book_select_list
    @books = Book.ransack(title_cont: params[:book_title]).result
    @books = @books.limit(20)
  end

  def add_book
    book_id = params[:id]
    @author = Author.find(params[:author_id])
    if @author.books.where(id: book_id).empty?
      @author.books << Book.find(book_id)
    end
    redirect_to author_path(@author)
  end

  def delete_book
    book_id = params[:book_id]
    @author = Author.find(params[:id])
    @author.books.delete(book_id)
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
