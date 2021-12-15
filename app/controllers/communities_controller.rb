class CommunitiesController < ApplicationController
  before_action :authenticate_user!, only: %i[new create]
  before_action :set_community, only: %i[show follow unfollow]

  def new
  end

  def create
    @community = Community.new(community_params)
    if @community.save
      redirect_to @community
    else
      render :new
    end
  end

  def index
    @communities = Community.all
  end

  def show
  end

  def follow
    current_user.follows.create(community: @community)
    redirect_to @community, notice: t('followed_community')
  end

  def unfollow
    current_user.follows.find_by(community: @community).destroy
    redirect_to @community, notice: t('unfollowed_community')
  end

  private

  def community_params
    params.require(:community).permit(:name, :description)
  end

  def set_community
    @community = Community.find(params[:id])
  end
end
