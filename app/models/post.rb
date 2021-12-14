class Post < ApplicationRecord
  acts_as_votable

  belongs_to :community
  belongs_to :user
  has_one :link
  has_one :topic
  has_many :comments

  validates :title, presence: true
  validates :user, presence: true
  validates :community, presence: true
end
