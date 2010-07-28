class Publication < ActiveRecord::Base
  validates_presence_of :title, :authors, :description, :year
  validates_numericality_of :year
  
  belongs_to :publication_type
  
  has_many :user_publications
  
  has_one :document, :as => :documentable, :dependent => :destroy
  accepts_nested_attributes_for :document
end
