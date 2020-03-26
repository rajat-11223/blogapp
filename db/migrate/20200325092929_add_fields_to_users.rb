class AddFieldsToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :name, :string
    add_reference :articles, :user, foreign_key: true, after: :title
  end
end
