class Message < ApplicationRecord
  belongs_to :chat
  belongs_to :user
  after_create :add_unread
  validates :body, presence: true


  def add_unread
    @users = User.where.not(id: self.user_id)
    @chat = Chat.find_by(id: self.chat_id)
    @user = @users.find_by(id: @chat.sender_id) || @users.find_by(id: @chat.receiver_id)
    @user.increment!(:unread)  
    if @user.id == @chat.sender_id
      @chat.increment!(:sender_unreads)
    else
      @chat.increment!(:receiver_unreads)
    end
  end
end
