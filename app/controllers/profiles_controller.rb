class ProfilesController < ApplicationController

  def create
    @profile = Profile.create(profile_params)
  end
  
  def show
    @profile = Profile.find_by(params[:id])
  end

  private 

  def profile_params
    params.require(:profile).permit(:bio, :location, :status)
  end
end
