class Book < ApplicationRecord
  default_scope { order(:title) }

  belongs_to :author

  has_many :categorizations, dependent: :destroy
  has_many :categories, through: :categorizations

  has_one_attached :cover_image

  validates :title, presence: true, length: {maximum: 80}
end
