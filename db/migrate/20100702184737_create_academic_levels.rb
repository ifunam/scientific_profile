class CreateAcademicLevels < ActiveRecord::Migration
  def self.up
    create_table :academic_levels do |t|
      t.string :name

      t.timestamps
    end
  end

  def self.down
    drop_table :academic_levels
  end
end
