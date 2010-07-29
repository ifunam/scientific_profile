class BooksController < ApplicationController
  respond_to :html

  def index
    respond_with(@books = BookEdition.all.paginate(:page => params[:page] || 1, :per_page => params[:per_page] || 10))
  end

  def show
    respond_with(@book = Book.find(params[:id]))
  end

  def new
    respond_with(@book = Book.new)
  end

  def edit
    respond_with(@book = Book.find(params[:id]))
  end

  def create
    respond_with(@book = Book.create(params[:book]), :status => :created)
  end

  def update
    @book = Book.find(params[:id])
    @book.update_attributes(params[:book])
    respond_with(@book, :status => :updated)
  end

  def destroy
    @book = Book.find(params[:id])
    @book.destroy
    respond_with(@book, :status => :deleted, :location => books_url)
  end
end

