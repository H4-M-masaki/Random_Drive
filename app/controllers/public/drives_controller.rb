class Public::DrivesController < ApplicationController



  def new
    @drive = Drive.new
  end

  def index
    @drives = Drive.where(user_id: current_user.id)
    
  end

  def edit
    @drive = Drive.find(params[:id])
  end

  def update
      @drive = Drive.find(params[:id])
   if @drive.update(drive_params)
      redirect_to public_drives_path
  　else
      render:edit
   end
  end

  def create
    @drive = Drive.new(drive_params)
    @drive.user_id = current_user.id
    #@drives = Drive.find(drive_params)
    if @drive.save
      redirect_to public_drives_path
    else
      render:new
    end
  end


  def destroy
    @drive = Drive.find(params[:id])
    @drive.destroy
    redirect_to public_drives_path
  end
  
  



private


  def drive_params
    params.require(:drive).permit(:address, :user, :latitude, :longitude)
  end
end
