class Cart < ActiveRecord::Base
  has_many :order_books, dependent: :destroy

  #before_save :subtotal

  def subtotal
    self[:total_price] = order_books.collect { |ob| ob.valid? ?  ob.sum_price : 0 }.sum
  end

end
