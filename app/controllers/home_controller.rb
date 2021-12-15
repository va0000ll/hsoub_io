class HomeController < ApplicationController
  def index
    if user_signed_in?
      @posts = []
      current_user.communities.each do |community|
        @posts += community.posts
      end
      @posts = @posts.sort_by(&:created_at).reverse
    end
  end
end
