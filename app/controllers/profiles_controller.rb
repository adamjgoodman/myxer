class ProfilesController < ApplicationController

  def create
    @profile = current_user.profile.create(profile_params)
  end
  
  def show
  end

  def edit
    @profile = Profile.find_by(params[:id])
  end

  def update
		@profile = Profile.find_by(params[:id])
    @profile.update_attributes(profile_params)
		if @profile.valid?
			redirect_to user_path(current_user)
		else
			return render :edit, status: :unprocessable_entity
		end
	end

  private 

  def profile_params
    params.require(:profile).permit(:bio, :location, :status, :user_id)
  end
end
