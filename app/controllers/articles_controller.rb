class ArticlesController < ApplicationController
  before_action :set_article, only: [:show, :edit, :update, :destroy]

  def index
    @articles = Article.all
  end

  def show
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(set_params)
    
    if @article.save
      flash[:notice] = "Article was save successfully."
      redirect_to @article
    else
      render :new, status: 422
    end
  end

  def edit
  end

  def update
    if @article.update(set_params)
      flash[:notice] = "Article was updated successfully"
      redirect_to @article
    else
      render 'edit', status: 422
    end
  end

  def destroy
    @article.destroy
    redirect_to articles_path
  end

  private

  def set_article
    @article = Article.find(params[:id])
  end

  def set_params
    params.require(:article).permit(:title, :description)
  end
end

