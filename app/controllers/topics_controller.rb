class TopicsController < ApplicationController
  before_action :authenticate_user!
  before_action :authenticate_moderator!, only: %i[edit update]
  before_action :set_topic, only: %i[edit update]

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

  def edit; end

  def update
    if @topic.update(topic_params)
      redirect_to @topic.post
    else
      render :edit
    end
  end

  private

  def set_topic
    @topic = Topic.find(params[:id])
  end

  def authenticate_moderator!
    redirect_to root_path, notice: t('not_authorized') unless current_user&.moderator?
  end

  def topic_params
    params.require(:topic).permit(:text)
  end

  def post_params
    params.require(:topic).permit(:community_id, :title)
  end
end
