class CreateBookEditions < ActiveRecord::Migration
  def self.up
    create_table :book_editions do |t|
      t.references :book, :edition_status
      t.string :edition, :place_of_publication, :publishers, :null => false
      t.integer :year, :null => false
      t.string :pages, :isbn
      t.references :mod_user, :class_name => 'User'
      t.timestamps
    end
  end

  def self.down
    drop_table :book_editions
  end
end
