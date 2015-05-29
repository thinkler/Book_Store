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

  has_and_belongs_to_many :authors
  belongs_to :category

  after_save :generate_short_about

  private 

  def generate_short_about
    array = self.about.split(".")
    p array
    short_about = ""
    for i in 0..2
      short_about += array[i] + "."
    end
    update_column(:short_about, short_about)
  end

end
