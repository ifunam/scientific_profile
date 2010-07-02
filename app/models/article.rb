class Article < ActiveRecord::Base
  normalize_attributes :title, :authors, :vol, :pages, :num
  
  validates_presence_of :title, :article_status_id, :year, :authors
  validates_numericality_of :id, :journal_id, :only_integer => true, :greater_than => 0, :allow_nil => true
  validates_numericality_of :article_status_id, :only_integer => true, :greater_than => 0
  validates_numericality_of :year, :greater_than => (Date.today.year - 100), :less_than_or_equal_to => (Date.today.year + 1), :only_integer => true
  validates_uniqueness_of :title, :scope => [:journal_id, :year]

  belongs_to :journal
  belongs_to :article_status
  has_one :document, :as => :documentable, :dependent => :destroy
  accepts_nested_attributes_for :document

  def as_text
    [authors, title, journal.name, journal_issue, pages].compact.join(', ')
  end

  def journal_issue
    info = year.to_s + ";"
    if vol != nil and num != nil
      info << "#{vol}(#{num})"
    elsif vol != nil
      info << vol
    elsif num != nil
      info << "(#{num})"
    end
    info
  end
end
