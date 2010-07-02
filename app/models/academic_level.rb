class AcademicLevel < ActiveRecord::Base
  validates :name, :presence => true, :uniqueness => true
  has_many :theses
  default_scope :order => 'name ASC'
end
