class OrderBook < ActiveRecord::Base
  belongs_to :book
  belongs_to :cart  

  before_save :calculate_total

  def calculate_total
    if quantity.nil?
      self[:quantity] = 1
    end
    self[:unit_price] = book.price
    self[:sum_price] = self[:unit_price] * self[:quantity]
  end

end
