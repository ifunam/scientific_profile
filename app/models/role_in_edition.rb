class RoleInEdition < ActiveRecord::Base
  validates_presence_of :name
  has_many :book_editions
  default_scope :order => 'name ASC'
end
