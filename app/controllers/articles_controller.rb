class ArticlesController < ApplicationController
before_action :authenticate_user!, except: %i[index	show]	
include ArticlesHelper
#include ApplicationHelper

def index
  @articles = Article.all
end

def show
@article = Article.find(params[:id])

@comment = Comment.new
@comment.article_id = @article.id
#byebug
end

def edit

@article = Article.find(params[:id])

end

def new
@article = Article.new
end


def create

@article = Article.new(article_params)
#@article.title = params[:article][:title]
@article.save
flash[:success] = "Article '#{@article.title}' Created Successfully!"
redirect_to article_path(@article)
end

def destroy
@article = Article.find(params[:id])
@article.destroy
redirect_to root_url
end


def update

  @article = Article.find(params[:id])
  @article.update(article_params)

  flash[:success] = "Article '#{@article.title}' Updated!"

  redirect_to article_path(@article)

end	




end
