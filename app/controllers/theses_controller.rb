class ThesesController < ApplicationController
  respond_to :html

  # GET /pages
  # GET /pages.xml
  def index
    respond_with(@theses = Thesis.all.paginate(:thesis => params[:thesis] || 1, :per_page => params[:per_page] || 10))
  end

  # GET /pages/1
  # GET /pages/1.xml
  def show
    respond_with(@thesis = Thesis.find(params[:id]))
  end

  # GET /pages/new
  # GET /pages/new.xml
  def new
    respond_with(@thesis = Thesis.new)
  end

  # GET /pages/1/edit
  def edit
    respond_with(@thesis = Thesis.find(params[:id]))
  end

  # POST /pages
  # POST /pages.xml
  def create
    respond_with(@thesis = Thesis.create(params[:thesis]), :status => :created)
  end

  # PUT /pages/1
  # PUT /pages/1.xml
  def update
    @thesis = Thesis.find(params[:id])
    @thesis.update_attributes(params[:thesis])
    respond_with(@thesis, :status => :updated)
  end

  # DELETE /pages/1
  # DELETE /pages/1.xml
  def destroy
    @thesis = Thesis.find(params[:id])
    @thesis.destroy
    respond_with(@thesis, :status => :deleted, :location => theses_path)
  end
end
