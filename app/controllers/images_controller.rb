class ImagesController < ApplicationController
  layout 'galleries'
  # skip_before_filter :verify_authenticity_token, :only => [:create]
  helper :application

  respond_to :html, :js, :only => [:index, :new, :show, :update]
  respond_to :json, :js, :only => [:create]
  respond_to :js, :only => [:destroy, :edit]

  def index
    @gallery = Gallery.find(params[:gallery_id])
    respond_with(@images = Image.where(:imageable_id => params[:gallery_id]).all.paginate(:page => params[:page] || 1, :per_page => params[:per_page] || 12))
  end
  
  def new
    respond_with(@image = Image.new) 
  end

  def show
    respond_with(@image = Image.find(params[:id])) do |format|
      format.html { render :action => :show,  :layout => false }
      format.js
    end
  end

  def create
    @image = Image.new(params[:image].merge(:imageable_id => params[:gallery_id], :imageable_type => 'Gallery'))
    if @image.save
      render :json => {:result => :success, :image => gallery_image_path(:gallery_id => params[:gallery_id], :id => @image.id) } 
      render :action => 'show.js' if request.xhr?
    else
      render :new 
    end
  end

  def edit
    respond_with(@image = Image.find(params[:id]))
  end

  def update
    @image = Image.find params[:id]
    @image.update_attributes(params[:image])
    respond_with(@image, :status => :updated) do |format|
      format.html { render :action => 'update', :layout => false}
    end
  end

  def destroy
    @image = Image.find params[:id]
    @image.destroy
    respond_with @image
  end

end