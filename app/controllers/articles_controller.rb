class ArticlesController < ApplicationController
  http_basic_authenticate_with name: "1234", password: "12345678", except: [:index,:new]
  def index
    @articles = Article.where("title LIKE ? OR content LIKE ?", "%#{params[:search]}%", "%#{params[:search]}%").order('created_at DESC')
  end

  def indexAdmin
    @articles = Article.where("title LIKE ? OR content LIKE ?", "%#{params[:search]}%", "%#{params[:search]}%").order('created_at DESC')
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new
    @article.title = params[:article][:title]
    @article.content = params[:article][:content]
    @article.number_of_views = 0
    if @article.save
      redirect_to '/admin/articles'
    else
      render :new
    end
  end

  def update
    @article = Article.find(params[:id])
    @article.update_attributes(article_params)
    redirect_to '/admin/articles'
  end

  def edit
    @article = Article.find(params[:id])
  end

  def delete
    Article.find(params[:id]).destroy
    redirect_to "/admin/articles"
  end

  def article_params
    params.require(:article).permit(:title, :content)
  end

  def show
    @article = Article.find(params[:id])
    @article.update_attribute(:number_of_views, @article.number_of_views + 1)
  end

end
