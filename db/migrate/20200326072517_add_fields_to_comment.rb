class AddFieldsToComment < ActiveRecord::Migration[6.0]
  def change
  	add_reference :comments, :user, foreign_key: true, after: :author_name

  	add_reference :reply_comments, :user, foreign_key: true, after: :name
  end
end
