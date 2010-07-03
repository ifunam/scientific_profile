class UserBookEdition < ActiveRecord::Base
  belongs_to :user
  belongs_to :book_edition
  belongs_to :role_in_edition
end
