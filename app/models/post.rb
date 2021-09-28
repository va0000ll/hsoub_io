class Post < ApplicationRecord
  belongs_to :community
  belongs_to :user
  has_one :link
  has_one :topic
  has_many :comments

  validates :title, presence: true
  validates :user, presence: true
  validates :community, presence: true
end
