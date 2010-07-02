class RoleInThesis < ActiveRecord::Base
  validates_presence_of :name
  has_many :theses
  default_scope :order => 'name ASC'
end
