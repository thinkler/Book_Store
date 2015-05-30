class CategoriesController < ApplicationController

  before_action :find_category, except: [:new, :index, :create, :search]

  def index
    @categories = Category.all
  end

  def show
    @books = @category.books.all.paginate(page: params[:page], per_page: 10)
    #@order_book = current_cart.order_books.new
  end

  def new
    @category = Category.new()
  end

  def create
    @category = Category.new(category_params)
    if @category.save
      redirect_to root_path
    else
      render 'new'
    end
  end

  def edit
  end

  def update
    if @category.update(category_params)
      redirect_to root_path
    else
      render 'edit'
    end
  end

  def destroy
    @category.destroy
    redirect_to root_path
  end

  def search
    @books = Book.ransack(title_cont: params[:title]).result
    @books = @books.all.paginate(page: params[:page], per_page: 10)
  end

  private 

  def category_params
    params.require(:category).permit(:title)
  end

  def find_category
    @category = Category.find(params[:id])
  end

end
