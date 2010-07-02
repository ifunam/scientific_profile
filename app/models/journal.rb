class Journal < ActiveRecord::Base
 normalize_attributes :name
 validates :name, :presence => true, :uniqueness => true
 has_many :articles
end
