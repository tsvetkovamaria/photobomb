class UserCommentsController < ApplicationController

  def new

  end

  def create
    @user_comment = UserComment.new(user_comment_params)
    @user_comment.save
    redirect_to :back
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def user_comment_params
    params.require(:user_comment).permit(:body, :score, :user_id, :photo_id)
  end

end
