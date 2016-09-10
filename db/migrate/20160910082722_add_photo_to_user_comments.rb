class AddPhotoToUserComments < ActiveRecord::Migration[5.0]
  def change
    add_reference :user_comments, :photo, foreign_key: true
  end
end
