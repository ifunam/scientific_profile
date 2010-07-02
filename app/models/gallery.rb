class Gallery < ActiveRecord::Base
  validates_presence_of :title

  belongs_to :user
  has_many :images, :as => :imageable
  accepts_nested_attributes_for :images  

  default_scope :order => 'title ASC'
end
