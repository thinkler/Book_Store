class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def current_cart
    if !session[:cart_id].nil?
      Cart.find(session[:cart_id])
    else
      Cart.new 
    end
  end

  def check_admin
    unless admin_signed_in?
      flash[:error] = "Perimit denied"
      redirect_to root_path
    end
  end


end
