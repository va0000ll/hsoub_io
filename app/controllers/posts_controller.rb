class PostsController < ApplicationController
  before_action :set_post, only: %i[show vote]

  def vote
    value = params[:type]
    if value == 'up'
      @post.vote_by voter: current_user, vote: 'like', vote_scope: 'reputation', vote_weight: 1
    else
      @post.vote_by voter: current_user, vote: 'dilike', vote_scope: 'reputation', vote_weight: -1
    end
    redirect_to @post, notice: t('voting_thanks')
  end

  def index
    @posts = Post.search(params[:search])
  end

  def show
    @comment = Comment.new
  end

  private

  def set_post
    @post = Post.friendly.find(params[:id])
  end
end
