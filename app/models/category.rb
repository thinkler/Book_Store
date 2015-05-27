class Category < ActiveRecord::Base
  VALID_CAT_NAME = /[a-zA-z]/i
  validates :title, presence: true, length: { minimum: 4 }, format: { with: VALID_CAT_NAME }

has_many :books, dependent: :destroy
end
