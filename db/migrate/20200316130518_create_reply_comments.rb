class CreateReplyComments < ActiveRecord::Migration[6.0]
  def change
    create_table :reply_comments do |t|
      t.references :comment, null: false, foreign_key: true
      t.string :name
      t.string :message
      t.timestamps
    end
  end
end
