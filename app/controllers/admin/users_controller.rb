class Admin::UsersController < ApplicationController
  respond_to :html

  # GET /pages
  # GET /pages.xml
  def index
    respond_with(@users = User.all.paginate(:user => params[:user] || 1, :per_page => params[:per_page] || 10))
  end

  # GET /pages/1
  # GET /pages/1.xml
  def show
    respond_with(@user = User.find(params[:id]))
  end

  # GET /pages/new
  # GET /pages/new.xml
  def new
    respond_with(@user = User.new)
  end

  # GET /pages/1/edit
  def edit
    respond_with(@user = User.find(params[:id]))
  end

  # POST /pages
  # POST /pages.xml
  def create
    respond_with(@user = User.create(params[:user]), :status => :created, :location => admin_user_path(@user))
  end

  # PUT /pages/1
  # PUT /pages/1.xml
  def update
    @user = User.find(params[:id])
    @user.update_attributes(params[:user])
    respond_with(@user, :status => :updated, :location => admin_user_path(@user))
  end

  # DELETE /pages/1
  # DELETE /pages/1.xml
  def destroy
    @user = User.find(params[:id])
    @user.destroy
    respond_with(@user, :status => :deleted, :location => admin_users_url)
  end
end
