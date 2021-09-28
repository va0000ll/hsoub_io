class Link < ApplicationRecord
  belongs_to :post

  validates :url, presence: true
  validates :post, presence: true
end
