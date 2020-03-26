class Comment < ApplicationRecord
  belongs_to :article
  has_many :reply_comment, :dependent => :destroy
end
