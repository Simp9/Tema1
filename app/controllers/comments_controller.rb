class CommentsController < ApplicationController
  def new
    @comment = Comment.new
    @comment.article_id = params[:id]
    @comment.save
  end

  def update
    @comment = Comment.find(params[:id])
    @comment.update_attributes(comment_params)
    redirect_to '/articles'
  end

  def comment_params
    params.require(:comment).permit(:name, :content)
  end
end
