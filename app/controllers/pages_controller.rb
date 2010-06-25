class PagesController < ApplicationController
  # GET /pages
  # GET /pages.xml
  respond_to :html
  def index
    respond_with(@pages = Page.all)
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
    respond_with(@page = Page.new(params[:page]), :status => :created, :location => @page)
  end

  # PUT /pages/1
  # PUT /pages/1.xml
  def update
    respond_with(@page = Page.find(params[:id]), :status => :updated, :location => @page)
  end

  # DELETE /pages/1
  # DELETE /pages/1.xml
  def destroy
    @page = Page.find(params[:id])
    @page.destroy
    respond_with(@page, :status => :deleted, :location => pages_url)
  end
end
