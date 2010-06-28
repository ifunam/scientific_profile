class PagesController < ApplicationController
  respond_to :html

  # GET /pages
  # GET /pages.xml
  def index
    respond_with(@pages = Page.all.paginate(:page => params[:page] || 1, :per_page => params[:per_page] || 10))
  end

  # GET /pages/1
  # GET /pages/1.xml
  def show
    respond_with(@page = Page.find(params[:id]))
  end

  # GET /pages/new
  # GET /pages/new.xml
  def new
    respond_with(@page = Page.new)
  end

  # GET /pages/1/edit
  def edit
    respond_with(@page = Page.find(params[:id]))
  end

  # POST /pages
  # POST /pages.xml
  def create
    respond_with(@page = Page.create(params[:page]), :status => :created)
  end

  # PUT /pages/1
  # PUT /pages/1.xml
  def update
    @page = Page.find(params[:id])
    @page.update_attributes(params[:page])
    respond_with(@page, :status => :updated)
  end

  # DELETE /pages/1
  # DELETE /pages/1.xml
  def destroy
    @page = Page.find(params[:id])
    @page.destroy
    respond_with(@page, :status => :deleted, :location => pages_url)
  end
end
