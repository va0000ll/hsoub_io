class User < ApplicationRecord
  acts_as_voter
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  #:recoverable
  devise :database_authenticatable, :registerable, :rememberable, :validatable

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :description, presence: true

  has_many :posts
  has_many :comments
  has_many :follows
  has_many :communities, through: :follows

  enum role: %i[user moderator admin]

  after_initialize :set_default_role, if: :new_record?

  def set_default_role
    self.role ||= :user
  end

  def reputation
    result = 0
    get_voted(Post).each do |post|
      result += post.get_upvotes(vote_scope: 'reputation').sum(:vote_weight)
      result += post.get_downvotes(vote_scope: 'reputation').sum(:vote_weight)
    end
    result
  end
end
