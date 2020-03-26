class AddPaperclipFieldsToArticle < ActiveRecord::Migration[6.0]
  def change
  	 add_column :articles, :article_image,    :string
  end
end
