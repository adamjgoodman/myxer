class MyxesController < ApplicationController
  def index
    @myx = Myx.all
  end

  def new
    @myx = Myx.new
  end
  
  def create
    @myx = current_user.myxes.create(myx_params)
    if @gram.valid?
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
