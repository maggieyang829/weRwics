class PhotosController < ApplicationController
  before_action :set_user
    
    
  def new
    @photo = @user.photos.new
  end
    
    
    
  def show
    @photo = @user.photos.find params[:id]
  end

  def create
    @photo = @user.photos.new(photo_params)
    @photo.user = @user
    
    if @photo.save
      redirect_to @user
    else
      render :new
    end
  end
  
  
  def edit
    @photo = @user.photos.find params[:id]
  end

  def update
    @photo = @user.photos.find params[:id]

    if @photo.update_attributes(photo_params)
      redirect_to @user
    else
      render :edit
    end
  end  
  
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:user_id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def photo_params
      params.require(:photo).permit(:title, :file)
    end
  
end