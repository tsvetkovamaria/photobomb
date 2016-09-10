class CreateUserComments < ActiveRecord::Migration[5.0]
  def change
    create_table :user_comments do |t|
      t.text :body
      t.integer :score
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
