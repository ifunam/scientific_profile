class UserChapter < ActiveRecord::Base
  belongs_to :user
  belongs_to :book_chapter
  belongs_to :role_in_chapter
end
