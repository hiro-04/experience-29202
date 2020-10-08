class CommentsController < ApplicationController
  def create
    if Comment.create(comment_params)
      redirect_to articles_path
    else
      redirect_to root_path
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:text).merge(user_id: current_user.id, article_id: params[:article_id])
  end
end
