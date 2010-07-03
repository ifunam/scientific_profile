class CreateUserBookEditions < ActiveRecord::Migration
  def self.up
    create_table :user_book_editions do |t|
      t.references :user
      t.references :book_edition
      t.references :role_in_edition
      t.timestamps
    end
  end

  def self.down
    drop_table :user_book_editions
  end
end
