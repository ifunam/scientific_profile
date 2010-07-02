class Thesis < ActiveRecord::Base
    normalize_attributes :title, :authors, :career_name, :faculty_or_school
    validates_presence_of :title, :authors, :career_name, :faculty_or_school, :institution_id, :academic_level_id, :start_year
    validates_uniqueness_of :title, :scope => [:start_year]
    validates_numericality_of :start_year, :greater_than => (Date.today.year - 100), :less_than_or_equal_to => (Date.today.year + 1), :only_integer => true
    validates_numericality_of :end_year, :greater_than => (Date.today.year - 100), :less_than_or_equal_to => (Date.today.year + 1), :only_integer => true, :allow_nil => true
    validates_numericality_of :start_month, :end_month, :greater_than => 0, :less_than_or_equal_to => 12, :only_integer => true, :allow_nil => true
    
    belongs_to :institution
    belongs_to :academic_level
    belongs_to :mod_user, :class_name  => 'User'

    has_many :user_theses
    has_many :users, :through => :user_theses

    has_one :user_thesis
    accepts_nested_attributes_for :user_thesis

    has_many :users, :through => :user_theses

    has_one :document, :as => :documentable, :dependent => :destroy
    accepts_nested_attributes_for :document
    
    default_scope :order => 'start_year DESC, start_month DESC, authors ASC, title ASC, is_finished ASC'
    
    def as_text
      [authors, title, institution.name, "#{academic_level.name} en #{career_name}", faculty_or_school].join(', ') + "; #{end_year || start_year}."
    end
end
