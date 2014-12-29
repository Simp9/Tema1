class CommentsController < ApplicationController
  def new
    @comment = Comment.new
  end

  def create
    @article = Article.where("id = ?", params[:id])
    @comment = Comment.new
    @comment.name = params[:comment][:name]
    @comment.content = params[:comment][:content]
    @comment.article_id = @article.id
    if @comment.save
      redirect_to '/articles'
    else
      render :new
    end
  end

  def index
    #@comments = Comment.all
    @comments = Comment.where("article_id = 9")
  end
end
