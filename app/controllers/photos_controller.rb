class PhotosController < ApplicationController

  before_action :authenticate_user!
  before_action :correct_user, only: :destroy 

  def index
    @photos = Photo.order('created_at DESC')
  end

  def show
    @photo = Photo.find(params[:id])
    @user_comment = UserComment.new
    @user_comments = @photo.user_comments.order('created_at DESC')
    @average = UserComment.average(:score)
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
    @photo = Photo.find(params[:id])
    @photo.destroy
    redirect_to :back
  end

  private

  def photo_params
    params.require(:photo).permit(:name, :image, :user_id)
  end
  
  def correct_user
    @photo = Photo.find(params[:id])
    redirect_to(root_path) unless current_user == @photo.user
  end

end
