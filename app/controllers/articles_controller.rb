class ArticlesController < ApplicationController
  before_action :assign_article

  def index
    @articles = Article.all
  end

  def show
  end

  def new
    @article = Article.new
  end

  def create
    Article.create(article_params)
    redirect_to root_path
  end

  def edit
  end

  def update
    @article.update(article_params)
    redirect_to article_path(@article)
  end

  def destroy
    @article.delete
    redirect_to root_path
  end

  private

  def assign_article
    @article = Article.find(params[:id]) unless params[:id].nil?
  end

  def article_params
    params.require(:article).permit(:title, :content)
  end

end
