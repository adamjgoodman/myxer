class ChatsController < ApplicationController
  before_action :authenticate_user!, only: [:create, :show] 

  def index
    @chats = current_user.chats
    @chats.sort_by { |chat| chat.messages.last.created_at }
    @chats.reverse!
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
    @messages = @chat.messages.order("created_at ASC")
  end

  def create
    @chat = Chat.create(chat_params)
    if @chat.valid?
      redirect_to request.referrer
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
    params.require(:chat).permit(:sender_id, :receiver_id, :first_message, :receiver_username)
  end

end
