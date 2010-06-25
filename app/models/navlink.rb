class Navlink < ActiveRecord::Base
  acts_as_nested_set
  validates_presence_of :title
  validates_numericality_of :parent_id, :lft, :rgt, :allow_nil => true

  scope :all_main_links, :conditions => 'parent_id IS NULL'

  belongs_to :navlinkable, :polymorphic => true

  def self.all_section_links
    all_main_links.order('title ASC').all.collect { |record|
      if record.is_parent?
        self.section_children(record)
      else
        record
      end
    }.flatten.compact
  end

  def self.section_children(parent)
      section = [parent]
      parent.children.each do |record|
          if record.is_parent?
            section.push(section_children(record))
          else
            section.push(record)
          end
      end
      section.flatten.compact
  end

  def title_with_ancestors
    self_and_ancestors.collect {|a| a.title }.join(' - ')
  end

  def is_parent?
      (children.size > 0 or parent.nil? or navlinkable.nil?) and url.to_s.empty?
  end
end
