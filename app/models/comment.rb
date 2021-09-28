class Comment < ApplicationRecord
  has_ancestry
  belongs_to :user
  belongs_to :post

  validates :text, presence: true
  validates :post, presence: true
  validates :user, presence: true
end
