class CanalsController < ApplicationController

  def index
    @canals = Canal.where(user_id: current_user.id).or(Canal.where(other_user: current_user.id))
  end

  def show

    @canal = Canal.find(params[:id])
    @messages = Message.where(canal_id: @canal.id)
    @message = Message.new()
  end

  def new
    @canal = Canal.new()
  end

  def create
    if User.exists?(id: params[:canal][:other_user])
      @canal = Canal.new(canal_params)
      @canal.other_user = params[:canal][:other_user]
      @canal.user = current_user
      if @canal.save
        redirect_to canals_path
      else
        render :new
      end
    end
  end

  private

  def canal_params
    params.require(:canal).permit(:user, :other_user)
  end
end
