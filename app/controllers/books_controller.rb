class BooksController < ApplicationController
  respond_to :html

  # GET /pages
  # GET /pages.xml
  def index
    respond_with(@books = BookEdition.all.paginate(:page => params[:page] || 1, :per_page => params[:per_page] || 10))
  end

  # GET /pages/1
  # GET /pages/1.xml
  def show
    respond_with(@book = Book.find(params[:id]))
  end

  # GET /pages/new
  # GET /pages/new.xml
  def new
    respond_with(@book = Book.new)
  end

  # GET /pages/1/edit
  def edit
    respond_with(@book = Book.find(params[:id]))
  end

  # POST /pages
  # POST /pages.xml
  def create
    respond_with(@book = Book.create(params[:book]), :status => :created)
  end

  # PUT /pages/1
  # PUT /pages/1.xml
  def update
    @book = Book.find(params[:id])
    @book.update_attributes(params[:book])
    respond_with(@book, :status => :updated)
  end

  # DELETE /pages/1
  # DELETE /pages/1.xml
  def destroy
    @book = Book.find(params[:id])
    @book.destroy
    respond_with(@book, :status => :deleted, :location => books_url)
  end
end

