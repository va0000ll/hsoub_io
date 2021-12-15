class Post < ApplicationRecord
  extend FriendlyId
  friendly_id :title, use: %i[slugged finders]
  acts_as_votable

  belongs_to :community
  belongs_to :user
  has_one :link
  has_one :topic
  has_many :comments

  validates :title, presence: true
  validates :user, presence: true
  validates :community, presence: true

  def self.search(query)
    if query
      where('title LIKE :query', query: "%#{query}%")
    else
      all
    end
  end

  def normalize_friendly_id(string)
    string.gsub(/\s+/, '-').gsub(/[^a-zA-Zأ-ي0-9-]*/, '')
  end
end
