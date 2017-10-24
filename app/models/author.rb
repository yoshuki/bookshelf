class Author < ApplicationRecord
  default_scope { order(:name) }
  has_many :books, dependent: :restrict_with_error
  validates :name, presence: true, length: {maximum: 40}
end
