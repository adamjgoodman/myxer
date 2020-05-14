class MessagesController < ApplicationController
  
  def create
    @chat = Chat.find_by_id(params[:chat_id])
    @chat.messages.create(message_params.merge(user: current_user))
    redirect_to request.referrer
  end

  private

  def message_params
    params.require(:message).permit(:body)
  end
end
