class PublicationsController < ApplicationController
  respond_to :html

  def index
    respond_with(@publications = Publication.all.paginate(:page => params[:page] || 1, :per_page => params[:per_page] || 10))
  end

  def show
    respond_with(@publication = Publication.find(params[:id]))
  end

  def new
    respond_with(@publication = Publication.new)
  end

  def edit
    respond_with(@publication = Publication.find(params[:id]))
  end

  def create
    respond_with(@publication = Publication.create(params[:publication]), :status => :created)
  end

  def update
    @publication = Publication.find(params[:id])
    @publication.update_attributes(params[:publication])
    respond_with(@publication, :status => :updated)
  end

  def destroy
    @publication = Publication.find(params[:id])
    @publication.destroy
    respond_with(@publication, :status => :deleted, :location => publications_url)
  end
end
