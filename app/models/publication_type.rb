class PublicationType < ActiveRecord::Base
  validates_presence_of :name
  has_many :publications
end
