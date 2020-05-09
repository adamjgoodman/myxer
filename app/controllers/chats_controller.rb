class ChatsController < ApplicationController

  def new 
    @chats = Chat.new
  end

  def show
    @chat = Chat.find(params[:id])
  end

  def create
    @chat = Chat.create(chat_params)
    if @chat.valid?
      redirect_to chat_path(@chat)
    end
  end

  private

  def chat_params 
    params.require(:chat).permit(:sender_id, :receiver_id)
  end

end
