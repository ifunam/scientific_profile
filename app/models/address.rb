class Address < ActiveRecord::Base
  validates_presence_of :location, :country, :city, :zipcode, :phone
  belongs_to :user
  
  def as_text
    myzipcode = 'C.P. ' + zipcode
    [location, myzipcode, city, state, country].compact.join(', ').gsub(/\n|\r/,'')
  end
end
