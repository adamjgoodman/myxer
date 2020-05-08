class ProfilesController < ApplicationController

  def create
    @profile = current_user.profile.create(profile_params)
  end
  
  def show
    @profile = Profile.find_by(params[:id])
    @user = User.find_by(id: @profile.user_id.to_i)
    @myxes = Myx.where(user_id: @user.id)
  end

  private 

  def profile_params
    params.require(:profile).permit(:bio, :location, :status, :user_id)
  end
end
