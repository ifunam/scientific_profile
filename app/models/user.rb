class User < ActiveRecord::Base

  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable, :lockable and :timeoutable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :home_page, :group_id, :is_admin, :person_attributes, :address_attributes
  #, :person, :address
  belongs_to :group
  
  has_one :person
  accepts_nested_attributes_for :person
  
  has_one :address
  accepts_nested_attributes_for :address
end
