class Person < ActiveRecord::Base
  validates_presence_of :firstname, :lastname, :gender, :birthdate

  has_one :image, :as => :imageable, :dependent => :destroy
  belongs_to :user
  accepts_nested_attributes_for :image
  
  def fullname
    [ self.firstname, self.lastname1.strip, (self.lastname2 != nil ? self.lastname2.strip : nil)].compact.join(' ')
  end
  
  def title_and_fullname
    [title, fullname].join(' ')
  end
end
