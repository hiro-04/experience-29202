class CommentsController < ApplicationController
  def create
    Comment.create(comment_params)
    redirect_to "/articles/#{comment.article.id}"
  end

  private
  def comment_params
    params.require(:comment).permit(:text, :article_id).merge(user_id: current_user.id)
  end
end
