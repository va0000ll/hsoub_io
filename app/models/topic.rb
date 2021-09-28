class Topic < ApplicationRecord
  belongs_to :post

  validates :text, presence: true
  validates :post, presence: true
end
