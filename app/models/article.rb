class Article < ApplicationRecord
has_many :comments, :dependent => :destroy
has_many :taggings, :dependent => :destroy
has_many :tags, through: :taggings, :dependent => :destroy
belongs_to :user
mount_uploader :article_image, AvatarUploader


def tag_list
#byebug
  self.tags.collect do |tag|
    tag.name
  end.join(", ")

end

# def tag_index

#  	# => byebug
#  # article = Article.find_by_id(article_id)
# 	self.tags.collect do |tag|
#     	tag.name
#   	end.join(", ")

# end 

def tag_list=(tags_string) 
  tag_names = tags_string.split(",").collect{|s| s.strip.downcase}.uniq
  new_or_found_tags = tag_names.collect { |name| Tag.find_or_create_by(name: name) }
  self.tags = new_or_found_tags 
  #byebug  
end


end
