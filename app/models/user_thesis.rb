class UserThesis < ActiveRecord::Base
  belongs_to :thesis
  belongs_to :user
  belongs_to :role_in_thesis
end
