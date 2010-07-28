class BookChaptersController < ApplicationController
  respond_to :html

  def index
    respond_with(@book_chapters = BookChapter.all.paginate(:page => params[:page] || 1, :per_page => params[:per_page] || 10))
  end

  def show
    respond_with(@book_chapter = BookChapter.find(params[:id]))
  end

  def new
    @book = Book.new
    @book.build_book_edition
    respond_with(@book)
  end

  def edit
    @book_chapter = BookChapter.find(params[:id])
    respond_with(@book = @book_chapter.book_edition.book)
  end

  def create
    respond_with(@book = Book.create(params[:book]), :status => :created, :location => book_chapter_path)
  end

  def update
    @book = Book.find(params[:id])
    @book.update_attributes(params[:book])
    book_id = params[:book][:book_edition_attributes][:book_chapter_attributes][:id]  
    respond_with(@book, :status => :updated, :location => book_chapter_path(:id => book_id))
  end

  def destroy
    @book = Book.find(params[:id])
    @book.destroy
    respond_with(@book, :status => :deleted, :location => book_chapters_url)
  end
end

