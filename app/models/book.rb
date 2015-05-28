class Book < ActiveRecord::Base

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
