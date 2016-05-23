class CategoriesController < ApplicationController

  def index
    @categories = Category.all
  end

  def new
    @category = Category.new
  end

  def create
    @category= Category.new(categories_params)
    if @category.save
      redirect_to @category
    else
      render :new
    end
  end

  def show
    @category = Category.find(params[:id])
    @articles = @category.articles
    @article = Article.new
  end

private
  def categories_params
    params.require(:category).permit(:name)
  end
end
