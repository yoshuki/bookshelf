class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  # :registerable, :recoverable, :rememberable, :trackable,
  devise :database_authenticatable, :validatable

  validates :first_name, length: {maximum: 20}
  validates :last_name, presence: true, length: {maximum: 20}

  def name
    return last_name if first_name.blank?
    "#{last_name} #{first_name}"
  end
end
