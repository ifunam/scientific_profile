class CreateUserTheses < ActiveRecord::Migration
  def self.up
    create_table :user_theses do |t|
      t.references :thesis, :user, :role_in_thesis, :null => false
      t.timestamps
    end
  end

  def self.down
    drop_table :user_theses
  end
end
