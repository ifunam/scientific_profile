class Page < ActiveRecord::Base
  validates_presence_of :title, :body
  belongs_to :author, :class_name => 'User', :foreign_key => 'author_id'
  has_one :navlink, :as => :navlinkable, :dependent => :destroy
end
