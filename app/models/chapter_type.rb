class ChapterType < ActiveRecord::Base
  validates_presence_of :name
  has_many :book_chapters
  default_scope :order => 'name ASC'
end
