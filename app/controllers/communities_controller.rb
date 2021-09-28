class CommunitiesController < ApplicationController
  before_action :authenticate_user!, only: %i[new create]
  before_action :set_community, only: %i[show]

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

  private

  def community_params
    params.require(:community).permit(:name, :description)
  end

  def set_community
    @community = Community.find(params[:id])
  end
end
