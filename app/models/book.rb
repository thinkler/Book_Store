class Book < ActiveRecord::Base

  NUM = /[0-9]/
  YEAR = /[1,2][0,5-9][0-9][0-9]/
  ISNB = /[0-9]{13}/

  validates :title, presence: true, length: { minimum: 5 }
  validates :price, presence: true, format: { with: NUM }
  validates :year, presence: true, format: { with: YEAR }
  validates :count, presence: true, format: { with: NUM }
  validates :isnb, presence: true, format: { with: ISNB }
  validates :about, presence: true, length: { minimum: 100 }

  has_many :order_book, dependent: :destroy
  has_and_belongs_to_many :authors
  belongs_to :category

  has_attached_file :book_img, styles: { large: "600x600>", medium: "300x300", thumb: "150x150#" }
  validates_attachment_content_type :book_img, :content_type => /\Aimage\/.*\Z/

  before_save :generate_short_about

  def plus_rating
    self[:rating] += 1
    self.save
  end

  private 

  def generate_short_about
    array = self.about.split(".")
    p array
    mini_about = ""
    for i in 0..2
      mini_about += array[i] + "."
    end
    self[:short_about] = mini_about
  end

end
