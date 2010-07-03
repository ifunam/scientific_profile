class ArticlesController < ApplicationController
  respond_to :html

  # GET /pages
  # GET /pages.xml
  def index
    respond_with(@articles = Article.all.paginate(:article => params[:article] || 1, :per_page => params[:per_page] || 10))
  end

  # GET /pages/1
  # GET /pages/1.xml
  def show
    respond_with(@article = Article.find(params[:id]))
  end

  # GET /pages/new
  # GET /pages/new.xml
  def new
    respond_with(@article = Article.new)
  end

  # GET /pages/1/edit
  def edit
    respond_with(@article = Article.find(params[:id]))
  end

  # POST /pages
  # POST /pages.xml
  def create
    respond_with(@article = Article.create(params[:article]), :status => :created)
  end

  # PUT /pages/1
  # PUT /pages/1.xml
  def update
    @article = Article.find(params[:id])
    @article.update_attributes(params[:article])
    respond_with(@article, :status => :updated)
  end

  # DELETE /pages/1
  # DELETE /pages/1.xml
  def destroy
    @article = Article.find(params[:id])
    @article.destroy
    respond_with(@article, :status => :deleted, :location => articles_path)
  end
end
