class PhotosController < ApplicationController

  before_action :authenticate_user!

  def index
    @photos = Photo.all
  end

  def show
    @photo = Photo.find(params[:id])
  end

  def new
    @photo = Photo.new
  end

  def create
    @photo = Photo.new(photo_params)
    if @photo.save
      redirect_to @photo
    else
      render 'edit'
    end
  end

  def destroy
  end

  private

  def photo_params
    params.require(:photo).permit(:name, :image, :user_id)
  end
  
end
