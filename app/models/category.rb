class Category < ApplicationRecord
  has_many :categorizations, dependent: :destroy
  has_many :books, through: :categorizations

  validates :name, presence: true, length: {maximum: 20}
end
