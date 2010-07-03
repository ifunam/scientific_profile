class CreateEditionStatuses < ActiveRecord::Migration
  def self.up
    create_table :edition_statuses do |t|
      t.string :name, :null => false

      t.timestamps
    end
  end

  def self.down
    drop_table :edition_statuses
  end
end
