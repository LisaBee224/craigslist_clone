class ArticlesController < ApplicationController

  def index

  end

  def new
    @article = Article.new
    @category = Category.find(params[:category_id])
  end

  def show
    @article = Article.find(params[:id])
    @category = Category.find_by(id: @article.category_id)
  end

  def edit
    @article = Article.find(params[:id])
  end

  def create
    @category = Category.find(params[:category_id])
    @article = @category.articles.new(articles_params)
    if @article.save
      redirect_to category_article_path(@category, @article)
        else
      render :new
    end
  end

  def update
    @article = Article.find(params[:id])
    if @article.update(article_params)
      redirect_to @article
    else
      render :edit
    end
  end

  def destroy
    @article = Article.find(params[:id])
    @article.destroy
    redirect_to articles_path
  end

  private
    def articles_params
      params.require(:article).permit(:title, :body).merge(category_id: params[:category_id])
    end
end
