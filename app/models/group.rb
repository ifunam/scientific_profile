class Group < ActiveRecord::Base
  validates_presence_of :name
  has_many :users
  default_scope :order => 'name ASC'
end
