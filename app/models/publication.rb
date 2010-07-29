class Publication < ActiveRecord::Base
  normalize_attributes :title, :authors, :description
  
  validates_presence_of :title, :authors, :description, :year
  validates_numericality_of :year
  
  belongs_to :publication_type
  
  has_many :user_publications
  
  has_one :document, :as => :documentable, :dependent => :destroy
  accepts_nested_attributes_for :document
  
  default_scope :order => 'year DESC, authors ASC, title ASC'
  
  def as_text
    "#{authors}. #{title}, #{year}."
  end
end
