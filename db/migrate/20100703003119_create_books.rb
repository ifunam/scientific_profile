class CreateBooks < ActiveRecord::Migration
  def self.up
    create_table :books do |t|
      t.text :title, :authors, :null => false
      t.string :volume
      t.text :url
      t.references :mod_user, :class_name => 'User'
      t.timestamps
    end
  end

  def self.down
    drop_table :books
  end
end
