class ArticlesController < ApplicationController
  before_action :set_q, only: [:index, :search]

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(article_params)
    @article.user_id = current_user.id
    if @article.save
      redirect_to articles_path
    else
      render :new
    end
  end

  def index
    @articles = Article.page(params[:page])
  end

  def show
    @article = Article.find(params[:id])
    @article_comment = ArticleComment.new
  end

  def destroy
    @article = Article.find(params[:id])
    @article.destroy
    redirect_to articles_path
  end

  def search
    @results = @q.result.page(params[:page])
  end

  private

  def set_q
    @q = Article.ransack(params[:q])
  end

  def article_params
    params.require(:article).permit(:title, :body)
  end
end
