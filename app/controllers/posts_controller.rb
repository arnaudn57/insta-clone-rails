class PostsController < ApplicationController

  def index
    @posts = Post.all
    @comment = Comment.new()
    @like = Like.new()
    @canal = Canal.new()
  end

  def show
    @post = Post.find(params[:id])
    @comment = Comment.new()
    @like = Like.new()
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id
    if @post.save
      redirect_to posts_path
    end
  end

  private

  def post_params
    params.require(:post).permit(:content, :comments, :likes, :user_id)
  end
end
