class MyxesController < ApplicationController
  def index
    @myx = Myx.all
  end
  
  def create
    @myx = current_user.myxes.create(myx_params)
    if @myx.valid?
			redirect_to root_path
		else
			render :new, status: :unprocessable_entity
		end
  end

  private

  def myx_params
    params.require(:myx).permit(:message)
  end

end
