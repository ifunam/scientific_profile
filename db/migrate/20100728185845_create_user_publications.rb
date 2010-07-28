class CreateUserPublications < ActiveRecord::Migration
  def self.up
    create_table :user_publications do |t|
      t.references :user
      t.references :publication
      t.boolean :is_main_author, :null => false, :default => true

      t.timestamps
    end
  end

  def self.down
    drop_table :user_publications
  end
end
