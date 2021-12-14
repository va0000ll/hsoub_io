class User < ApplicationRecord
  acts_as_voter
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  #:recoverable
  devise :database_authenticatable, :registerable, :rememberable, :validatable


  has_many :posts
  has_many :comments

  def reputation
    result = 0
    get_voted(Post).each do |post|
      result += post.get_upvotes(vote_scope: 'reputation').sum(:vote_weight)
      result += post.get_downvotes(vote_scope: 'reputation').sum(:vote_weight)
    end
    result
  end
end
