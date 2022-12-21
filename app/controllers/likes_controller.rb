class LikesController < ApplicationController

  def new
    @like = Like.new()
  end

  def create
    if Post.exists?(id: params[:post_id])
      @like = Like.find_by(post_id: params[:post_id])
      @total_likes = @like.likes_number + 1
      @like.update(likes_number: @total_likes)
      redirect_to post_path(params[:post_id])
    else
      @like = Like.new()
      @like.post_id = params[:post_id]
      @like.likes_number = params[:like][:likes_number]

      if @like.save
        redirect_to post_path(params[:post_id])
      end
    end
  end
end
