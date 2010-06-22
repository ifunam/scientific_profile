class CreateNavlinks < ActiveRecord::Migration
  def self.up
    create_table :navlinks do |t|
      t.string  :title, :url
      t.integer :parent_id, :lft, :rgt
      t.references :navlinkable, :polymorphic => true 
      t.timestamps
    end
  end

  def self.down
    drop_table :navlinks
  end
end
