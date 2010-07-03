class CreateBookChapters < ActiveRecord::Migration
  def self.up
    create_table :book_chapters do |t|
      t.references :book_edition, :chapter_type
      t.text :title, :null => false
      t.string :pages
      t.references :mod_user, :class_name => 'User'
      t.timestamps
    end
  end

  def self.down
    drop_table :book_chapters
  end
end
