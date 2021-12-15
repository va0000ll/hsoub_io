class HomeController < ApplicationController
  def index
    @posts = []
    puts "current_user.communities: #{current_user.communities.count}"
    current_user.communities.each do |community|
      puts "co: #{community}"
      @posts += community.posts
    end
    @posts = @posts.sort_by(&:created_at).reverse
  end
end
