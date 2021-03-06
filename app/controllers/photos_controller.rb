class PhotosController < ApplicationController

  before_action :authenticate_user!
  before_action :correct_user, only: :destroy 

  def index
    @photos = Photo.order('created_at DESC').paginate(:page => params[:page], :per_page => 9)

  end

  def show
    @photo = Photo.find(params[:id])
    @user_comment = UserComment.new
    @user_comments = @photo.user_comments.order('created_at DESC')
    @average = @user_comments.average(:score)
  end

  def new
    @photo = Photo.new
  end

  def create
    @photo = Photo.new(photo_params)
    if @photo.save
      flash[:success] = "Photo successfully uploaded"
      redirect_to @photo
    else
      flash[:danger] = "Something went wrong"
      render 'new'
    end
  end

  def destroy
    @photo = Photo.find(params[:id])
    @photo.destroy
    flash[:success] = "Photo successfully destroyed"
    redirect_to root_path
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
