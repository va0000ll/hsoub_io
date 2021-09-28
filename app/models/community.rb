class Community < ApplicationRecord
  has_many :posts

  validates :name, presence: true
  validates :description, presence: true
end
