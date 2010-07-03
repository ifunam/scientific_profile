class BookChapter < ActiveRecord::Base
  normalize_attributes :title, :pages
  validates_presence_of :title, :chapter_type_id
  belongs_to :book_edition
  belongs_to :chapter_type
  belongs_to :mod_user, :class_name => 'User'
  has_many :user_book_chapters
  
  has_one :user_book_chapter
  accepts_nested_attributes_for :user_book_chapter

  has_one :document, :as => :documentable, :dependent => :destroy
  accepts_nested_attributes_for :document  
end
