class ArticleCommentsController < ApplicationController

  def create
    @article = Article.find(params[:article_id])
    comment = ArticleComment.new(article_comment_params)
    comment.user_id = current_user.id
    comment.article_id = @article.id
    if !comment.save
      @error_comment = comment
      render :error
    end
  end

  def destroy
    @article = Article.find(params[:article_id])
    ArticleComment.find(params[:id]).destroy
  end

  private

  def article_comment_params
    params.require(:article_comment).permit(:comment)
  end
end
