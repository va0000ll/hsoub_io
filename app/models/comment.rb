class Comment < ApplicationRecord
  include SharedMethods
  has_ancestry
  belongs_to :user
  belongs_to :post

  validates :text, presence: true
  validates :post, presence: true
  validates :user, presence: true
  after_commit :create_notifications, on: :create

end
