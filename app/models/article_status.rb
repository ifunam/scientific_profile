class ArticleStatus < ActiveRecord::Base
  validates :name, :presence => true, :uniqueness => true
  has_many :articles
  
  default_scope :order => 'name ASC'
end
