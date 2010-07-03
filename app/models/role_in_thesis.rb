class RoleInThesis < ActiveRecord::Base
  validates_presence_of :name
  has_many :user_theses
  default_scope :order => 'name ASC'
end
