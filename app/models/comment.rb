class Comment < ApplicationRecord
  belongs_to :article
  belongs_to :user
  has_many :reply_comment, :dependent => :destroy
end
