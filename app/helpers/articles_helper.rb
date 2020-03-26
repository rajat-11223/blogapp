module ArticlesHelper

def article_params
    params.require(:article).permit(:title,:user_id,:body, :tag_list,:article_image)
  end


 
	
end
