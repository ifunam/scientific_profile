class Page < ActiveRecord::Base
  attr_accessor :navlink_section_id

  validates_presence_of :title, :body

  belongs_to :author, :class_name => 'User', :foreign_key => 'author_id'
  has_one :navlink_section, :as => :navlinkable, :dependent => :destroy
  has_one :image, :as => :imageable
  accepts_nested_attributes_for :image

  default_scope :order => 'title ASC, updated_at DESC'

  after_save :associate_to_navlink_section

  def associate_to_navlink_section
    if :new_record? and navlink_section_id.to_i > 0
      navlink = Navlink.create!(:navlinkable => self, :title => self.title)
      navlink.move_to_child_of self.navlink_section_id.to_i
    end
  end
end
