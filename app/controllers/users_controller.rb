class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
    @profile = @user.profile
    @myxes = Myx.where(user_id: @user.id)
  end
end
