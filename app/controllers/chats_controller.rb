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

  def destroy
    @chat = Chat.find_by_id(params[:id])
    @receiver = User.find_by(user_id: @chat.receiver_id.to_i)
    redirect_to user_path(@receiver)
    @chat.destroy
  end

  private

  def chat_params 
    params.require(:chat).permit(:sender_id, :receiver_id, :first_message)
  end

end
