class CommentsController < ApplicationController

  def new
    @comment = Comment.new()
  end

  def create
    @comment = Comment.new()
    @comment.post_id = params[:post_id]
    @comment.comment_content = params[:comment][:comment_content]
    if @comment.save
      redirect_to posts_path
    end
  end

  def comments_params
    params.require(:comment).permit(:comment_content, :post_id)
  end
end
