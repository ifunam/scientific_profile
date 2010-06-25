class Navlink < ActiveRecord::Base
  acts_as_nested_set
  validates_presence_of :title
  validates_numericality_of :parent_id, :lft, :rgt, :allow_nil => true

  scope :all_main_links, :conditions => 'parent_id IS NULL'

  belongs_to :navlinkable, :polymorphic => true

  def is_parent?
    (children.size > 0 or parent.nil? or navlinkable.nil?) and url.to_s.empty?
  end

end
