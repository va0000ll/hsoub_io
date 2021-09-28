class LinksController < ApplicationController
  before_action :authenticate_user!

  def new
  end

  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id
    @link = Link.new(link_params)
    if @post.save
      @link.post = @post
      if @link.save
        redirect_to @post
      else
        render :new
      end
    else
      @link.valid?
      render :new
    end
  end

  private

  def link_params
    params.require(:link).permit(:url)
  end

  def post_params
    params.require(:link).permit(:community_id, :title)
  end
end
