require 'spec_helper'

describe User do
  
  it "Should create a new user" do 
   @user =  User.new(:email => 'alecz@fisica.unam.mx', :password => 'testpw', :password_confirmation => 'testpw')
   @user.save.should be true
  end

  it "Should not create an invalid user" do 
   @user =  User.new(:email => 'alec@fisica.unam.mx', :password => 'passwd1', :password_confirmation => 'passswd2')
   @user.save.should_not be true
  end


  it "Should change password" do 
    @user =  User.new(:email => 'alecz@fisica.unam.mx', :password => 'testpw', :password_confirmation => 'testpw')
    @user.save.should be true
    @user.update_attributes(:password => 'pwtest', :password_confirmation => 'pwtest').should be true
    @user.update_attributes(:password => 'pwtest', :password_confirmation => 'tespw').should_not be true
  end

end
