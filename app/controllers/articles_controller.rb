class ArticlesController < ApplicationController

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
  end
  
  def show
  end

  def destroy
  end

  private

  def article_params
    binding.pry
    params.require(:article).permit(:title, :content, :category_id).merge(user_id: current_user.id)
  end

end
