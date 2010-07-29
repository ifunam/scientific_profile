class Admin::UsersController < ApplicationController
  respond_to :html

  def index
    respond_with(@users = User.all.paginate(:user => params[:page] || 1, :per_page => params[:per_page] || 10))
  end

  def show
    respond_with(@user = User.find(params[:id]))
  end

  def new
    respond_with(@user = User.new)
  end

  def edit
    respond_with(@user = User.find(params[:id]))
  end

  def create
    respond_with(@user = User.create(params[:user]), :status => :created, :location => admin_user_path(@user))
  end

  def update
    @user = User.find(params[:id])
    @user.update_attributes(params[:user])
    respond_with(@user, :status => :updated, :location => admin_user_path(@user))
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    respond_with(@user, :status => :deleted, :location => admin_users_url)
  end
end
