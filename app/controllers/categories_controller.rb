class CategoriesController < ApplicationController

  before_action :find_category, except: [:new, :index, :create, :search]


  add_breadcrumb "Home", :root_path

  def index
    @categories = Category.all
  end

  def show
    add_breadcrumb "#{@category.title}", :category_path
    @q = @category.books.ransack(params[:q])
    @books = @q.result.paginate(page: params[:page], per_page: 10).order('created_at DESC')
    @order_book = current_cart.order_books.new
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
    add_breadcrumb "Search results"
    unless params[:q]
      params[:q] = {}
    end
    @counts = []
    @title = params[:title]
    params[:q][:title_cont] = params[:title]
    @q = Book.ransack(params[:q])
    #@books = Book.ransack(title_cont: params[:title], category_id_eq: params[:cat_id]).result
    @books = @q.result.all.paginate(page: params[:page], per_page: 10)
    @categories = Category.all
    @categories.each do |cat|
      @counts << cat.books.ransack(title_cont: params[:title]).result.count      
    end
  end

  private 

  def category_params
    params.require(:category).permit(:title)
  end

  def find_category
    @category = Category.find(params[:id])
  end

end
