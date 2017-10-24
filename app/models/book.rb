class Book < ApplicationRecord
  default_scope { order(:title) }
  belongs_to :author
  validates :title, presence: true, length: {maximum: 80}
end
