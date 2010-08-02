class ThesesController < ApplicationController
  respond_to :html

  def index
    respond_with(@theses = Thesis.all.paginate(:page => params[:page] || 1, :per_page => params[:per_page] || 10))
  end

  def show
    respond_with(@thesis = Thesis.find(params[:id]))
  end

  def new
    respond_with(@thesis = Thesis.new)
  end

  def edit
    respond_with(@thesis = Thesis.find(params[:id]))
  end

  def create
    respond_with(@thesis = Thesis.create(params[:thesis]), :status => :created)
  end

  def update
    @thesis = Thesis.find(params[:id])
    @thesis.update_attributes(params[:thesis])
    respond_with(@thesis, :status => :updated)
  end

  def destroy
    @thesis = Thesis.find(params[:id])
    @thesis.destroy
    respond_with(@thesis, :status => :deleted, :location => theses_path)
  end
end
