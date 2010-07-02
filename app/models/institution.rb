class Institution < ActiveRecord::Base
  normalize_attributes :name
  validates :name, :presence => true, :uniqueness => true
  has_many :theses
  default_scope :order => 'name ASC'
end
