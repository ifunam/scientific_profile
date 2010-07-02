class CreateDocuments < ActiveRecord::Migration
  def self.up
    create_table :documents do |t|
      t.string :file
      t.references :documentable, :polymorphic => true 
      t.timestamps
    end
  end

  def self.down
    drop_table :documents
  end
end
