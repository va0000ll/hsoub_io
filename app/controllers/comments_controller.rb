class CommentsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_post, only: %i[create new]

  def new
    @comment = Comment.find(params[:parent_id])
  end

  def create
    @comment = @post.comments.new(comment_params)
    @comment.ancestry = params[:comment][:parent_id]
    @comment.user = current_user
    flash[:notice] = if @comment.save
                       t('comment.create.success')
                     else
                       @comment.errors.messages.values.first
                     end
    redirect_to @post
  end

  def user_comments
    @user = User.find_by_id(params[:u_id])
    @comments = @user.comments.where(ancestry: nil)
  end

  private

  def comment_params
    params.require(:comment).permit(:text)
  end

  def set_post
    @post = Post.friendly.find(params[:post_id])
  end
end
