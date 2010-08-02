class PublicationType < ActiveRecord::Base
  validates_presence_of :name
  has_many :publications
  default_scope :order => 'name ASC'
end
