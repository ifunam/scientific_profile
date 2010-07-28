class CreatePublications < ActiveRecord::Migration
  def self.up
    create_table :publications do |t|
      t.string :title, :authors, :description, :null => false
      t.integer :year, :null => false
      t.references :publication_type
      t.timestamps
    end
  end

  def self.down
    drop_table :publications
  end
end
