class CreateUserChapters < ActiveRecord::Migration
  def self.up
    create_table :user_chapters do |t|
      t.references :user
      t.references :book_chapter
      t.references :role_in_chapter
      t.timestamps
    end
  end

  def self.down
    drop_table :user_chapters
  end
end
