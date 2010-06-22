class Navlink < ActiveRecord::Base
  acts_as_nested_set
  validates_presence_of :title
  validates_numericality_of :parent_id, :lft, :rgt, :allow_nil => true
  
  scope :main_links, :conditions => 'parent_id IS NULL'
  belongs_to :navlinkable, :polymorphic => true
end
