class Author < ApplicationRecord
  default_scope { order(:name) }
  validates :name, presence: true, length: {maximum: 40}
end
