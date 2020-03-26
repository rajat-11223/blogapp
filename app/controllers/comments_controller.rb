class CommentsController < ApplicationController
include CommentsHelper

def create
  @comment = Comment.new(comment_params)
  @comment.article_id = params[:article_id]
  @comment.user_id = current_user.id
  @comment.save
  redirect_to article_path(@comment.article)
end


def add_reply

	commentuser_id = Comment.find_by_id(params[:article_id])
	@reply_comment = ReplyComment.new
	@reply_comment.comment_id = params[:article_id]
	@reply_comment.user_id = current_user.id
	@reply_comment.message = params[:reply_msg]
	@reply_comment.save
	redirect_to article_path(commentuser_id.article_id)

end


def reply_popup
	if params[:article_id].present?
	 #@reply_comment = ReplyComment.new
		respond_to do |format|
		format.js {render 'comments/partial/js/reply_popup'}
		end
	end
end

def delete_comment
@comment = Comment.find(params[:comment_id])
@comment.destroy
redirect_to root_url

end



end
