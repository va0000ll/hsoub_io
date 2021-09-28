class CommentsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_post, only: :create

  def create
    @comment = @post.comments.new(comment_params)
    @comment.user = current_user
    flash[:notice] = if @comment.save
                       t('comment.create.success')
                     else
                       @comment.errors.messages.values.first
                     end
    redirect_to @post
  end

  private

  def comment_params
    params.require(:comment).permit(:text)
  end

  def set_post
    @post = Post.find(params[:post_id])
  end

  def set_comment
    @comment = Comment.find(params[:id])
  end
end
