class MessagesController < ApplicationController

  def index
    @messages = Message.where(canal_id: params[:canal_id])
  end
  def new
    @message = Message.new()
  end

  def create
    # raise
    @message = Message.new()
    @message.message = params[:message][:message]
    @message.canal = Canal.find(params[:canal_id])
    @message.user_id = current_user.id
    if @message.save
      redirect_to canal_path(@message.canal)
    end
  end
end
