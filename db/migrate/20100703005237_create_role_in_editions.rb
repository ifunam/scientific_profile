class CreateRoleInEditions < ActiveRecord::Migration
  def self.up
    create_table :role_in_editions do |t|
      t.string :name, :null => false
      t.timestamps
    end
  end

  def self.down
    drop_table :role_in_editions
  end
end
