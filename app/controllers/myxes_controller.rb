class MyxesController < ApplicationController
  def index
    @myx = Myx.all
  end

  def new
    @myx = Myx.new
  end
  
  def create
    @myx = Myx.create(myx_params)
  end

  private

  def myx_params
    params.require(:myx).permit(:message)
  end

end
