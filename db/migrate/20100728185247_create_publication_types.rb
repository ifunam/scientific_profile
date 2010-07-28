class CreatePublicationTypes < ActiveRecord::Migration
  def self.up
    create_table :publication_types do |t|
      t.string :name

      t.timestamps
    end
  end

  def self.down
    drop_table :publication_types
  end
end
