class EditionStatus < ActiveRecord::Base
  validates :name, :presence => true, :uniqueness => true
  has_many :book_editions
  default_scope :order => 'name ASC'
end
