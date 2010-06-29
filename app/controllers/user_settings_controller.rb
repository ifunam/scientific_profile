class UserSettingsController < ApplicationController
  respond_to :html
  def show
    respond_with(@user= User.find(current_user.id))
  end
  
  def edit
    respond_with(@user= User.find(current_user.id))
  end
  
  def update
      @user= User.find(current_user.id)
      @user.update_attributes(params[:user])
      respond_with(@user, :status => :updated, :location => user_settings_path)
  end
end