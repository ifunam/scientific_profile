class Admin::NavlinksController < ApplicationController
  respond_to :html
  #respond_to :js, :only => [:move_right, :move_left]
  def index
    respond_with(@navlinks = Navlink.all_main_links.paginate(:page => params[:page] || 1, :per_page => params[:per_page] || 10))
  end

  def show
    respond_with(@navlink = Navlink.find(params[:id]))
  end

  def new
    respond_with(@navlink = Navlink.new)
  end

  def edit
    respond_with(@navlink = Navlink.find(params[:id]))
  end

  def create
    respond_with(@navlink = Navlink.create(params[:navlink]), :status => :created, :location => admin_navlink_path(@navlink))
  end

  def update
    @navlink = Navlink.find(params[:id])
    @navlink.update_attributes(params[:navlink])
    respond_with(@navlink, :status => :updated, :location => admin_navlink_path(@navlink))
  end

  def destroy
    @navlink = Navlink.find(params[:id])
    @navlink.destroy
    respond_with(@navlink, :status => :deleted, :location => admin_navlinks_url)
  end  
  
  def move_up
    @navlink = Navlink.find(params[:id])
    redirect_to admin_navlinks_url if @navlink.move_left
  end
  
  def move_down
    @navlink = Navlink.find(params[:id])
    redirect_to admin_navlinks_url if @navlink.move_right
  end

end