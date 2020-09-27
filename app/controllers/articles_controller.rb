class ArticlesController < ApplicationController

  def index
    @articles = Article.all
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(article_params)
  end

  def edit
  end

  def update
  end
  
  def show
  end

  def destroy
  end

  private

  def article_params
    params.require(:article).permit(:title, :content, :category_id)
  end

end
