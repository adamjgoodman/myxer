class ChatsController < ApplicationController
  before_action :authenticate_user!, only: [:create, :show] 

  def index
    @chats = current_user.chats
  end

  def new 
    @chats = Chat.new
  end

  def show
    @chat = Chat.find(params[:id])
    unless [@chat.receiver_id, @chat.sender_id].include? current_user.id
      redirect_to root_path, alert: 'Not allowed.'
    end
    @message = Message.new
    @messages = @chat.messages.order('created_at DESC').reverse
  end

  def create
    @chat = Chat.create(chat_params)
    if @chat.valid?
      redirect_to user_path(@chat.receiver_id)
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
