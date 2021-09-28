class TopicsController < ApplicationController
  before_action :authenticate_user!

  def new
  end

  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id
    @topic = Topic.new(topic_params)
    if @post.save
      @topic.post = @post
      if @topic.save
        redirect_to @post
      else
        render :new
      end
    else
      @topic.valid?
      render :new
    end
  end

  private

  def topic_params
    params.require(:topic).permit(:text)
  end

  def post_params
    params.require(:topic).permit(:community_id, :title)
  end
end
