class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
    @profile = @user.profile
    @myxes = Myx.where(user_id: @user.id)
    @chat = Chat.new
    @ourchat = Chat.find_by(receiver_id: current_user.id, sender_id: @profile.user_id) || Chat.find_by(sender_id: current_user.id, receiver_id: @profile.user_id)
  end
end
