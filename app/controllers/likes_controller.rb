class LikesController < ApplicationController
  before_action :article_params, only: [:create, :destroy]

  def create
    Like.create(user_id: current_user.id, article_id: params[:id])
    redirect_to article_path
  end

  def destroy
    Like.find_by(user_id: current_user.id, article_id: params[:id]).destroy
    redirect_to root_path
  end
  

  private

  def article_params
    @article = Article.find(params[:id])
  end
end


# def create
#   Like.create(user_id: current_user.id, article_id: params[:id])
#   redirect_to 'articles#index'
# end

# def destroy
#   Like.find_by(user_id: current_user.id, article_id: params[:id]).destroy
#   redirect_to 'articles#index'
# end
