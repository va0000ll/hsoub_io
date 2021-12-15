class LinksController < ApplicationController
  before_action :authenticate_user!
  before_action :authenticate_moderator!, only: %i[edit update]
  before_action :set_link, only: %i[edit update]

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

  def edit; end

  def update
    if @link.update(link_params)
      redirect_to @link.post
    else
      render :edit
    end
  end

  private

  def authenticate_moderator!
    redirect_to root_path, notice: t('not_authorized') unless current_user&.moderator?
  end

  def link_params
    params.require(:link).permit(:url)
  end

  def post_params
    params.require(:link).permit(:community_id, :title)
  end

  def set_link
    @link = Link.find(params[:id])
  end
end
