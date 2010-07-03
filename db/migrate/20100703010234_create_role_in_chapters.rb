class CreateRoleInChapters < ActiveRecord::Migration
  def self.up
    create_table :role_in_chapters do |t|
      t.string :name

      t.timestamps
    end
  end

  def self.down
    drop_table :role_in_chapters
  end
end
