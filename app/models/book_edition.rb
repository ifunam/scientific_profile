class BookEdition < ActiveRecord::Base
  normalize_attributes :edition, :year, :place_of_publication, :publishers
  validates_presence_of :edition, :year, :place_of_publication, :publishers
  validates_uniqueness_of :edition, :scope => [:book_id, :year]
  belongs_to :book
  belongs_to :edition_status

  belongs_to :mod_user, :class_name  => 'User'

  has_many :user_book_editions
  has_many :users, :through => :user_book_editions

  has_one :user_book_edition
  accepts_nested_attributes_for :user_book_edition

  has_many :book_chapters

  has_one :book_chapter
  accepts_nested_attributes_for :book_chapter
  
  has_one :document, :as => :documentable, :dependent => :destroy
  accepts_nested_attributes_for :document

  def edition_text
    text = [edition, book.vol, "#{place_of_publication}:#{publishers}"].compact.join('. ') + "; #{year}."
    text += " #{pages}." unless pages.to_s.strip.empty?
    text
  end 
  
  def as_text
   book.authors_and_title + ' ' + edition_text
  end
end
