class ArticlesController < ApplicationController
  respond_to :html

  def index
    respond_with(@articles = Article.all.paginate(:article => params[:article] || 1, :per_page => params[:per_page] || 10))
  end

  def show
    respond_with(@article = Article.find(params[:id]))
  end

  def new
    respond_with(@article = Article.new)
  end

  def edit
    respond_with(@article = Article.find(params[:id]))
  end

  def create
    respond_with(@article = Article.create(params[:article]), :status => :created)
  end

  def update
    @article = Article.find(params[:id])
    @article.update_attributes(params[:article])
    respond_with(@article, :status => :updated)
  end

  def destroy
    @article = Article.find(params[:id])
    @article.destroy
    respond_with(@article, :status => :deleted, :location => articles_path)
  end
end
