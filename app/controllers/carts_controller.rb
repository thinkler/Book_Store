class CartsController < ApplicationController

  add_breadcrumb "Home", :root_path

  before_action :check_admin, except: [:show, :update, :edit]

  def show
    if !admin_signed_in?
      add_breadcrumb "Cart"
      @cart = current_cart
      @cart.subtotal
      @cart.save
    else
      @cart = Cart.find(params[:id])
    end
    @books = @cart.order_books
  end

  def index
    add_breadcrumb "Carts" 
    @carts = Cart.all.paginate(page: params[:page], per_page: 20).order('created_at DESC')
  end

  def edit
    add_breadcrumb "Ordering"
    @cart = current_cart
  end

  def update
    unless params[:cart][:status]
      @cart = current_cart

      if @cart.update(cart_params)
        @cart.order_books.each do |ob|
          ob.book.plus_rating
          count = 0
          count = ob.book.count.to_i - ob.quantity.to_i
          ob.book.update(count: count)
        end
        flash[:notice] = "Order sended"
        redirect_to root_path
        session.clear
      else
        flash[:alert] = "Complete all fields"
        render 'edit'
      end
    else
      @cart = Cart.find(params[:id])  
      @cart.update_attribute('status', cart_params[:status])
      flash[:notice] = "Updated"
      redirect_to carts_path
    end
  end

  def destroy
    @cart = Cart.find(params[:id])
    @cart.destroy
    flash[:notice] = "Deleted"
    redirect_to carts_path
  end

  private 

  def cart_params
    params.require(:cart).permit(:name, :phone, :adress, :status)
  end
end
