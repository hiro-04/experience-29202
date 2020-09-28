class ArticlesController < ApplicationController
  before_action :set_article, only:[:show, :edit, :update, :destory]

  def index
    @articles = Article.all
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(article_params)
    if @article.save
      redirect_to root_path
    else
      render:new
    end
  end

  def edit
  end

  def update
    if @article.update(article_params)
      redirect_to root_path
    else
      render :ecit
    end
  end
  
  def show
  end

  def destroy
    if @article.destroy
      redirect_to root_path
    else
      render :edit
    end
  end

  private

  def article_params
    params.require(:article).permit(:title, :content, :category_id).merge(user_id: current_user.id)
  end

  def set_article
    @article = Article.find(params[:id])
  end

end
