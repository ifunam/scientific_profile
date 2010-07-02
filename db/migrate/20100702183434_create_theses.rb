class CreateTheses < ActiveRecord::Migration
  def self.up
    create_table :theses do |t|
      t.string :title, :authors, :career_name, :faculty_or_school, :null => false
      t.references :institution, :academic_level
      t.references :mod_user, :class_name => 'User'
      t.integer :start_year, :null => false
      t.integer :start_month, :end_year, :end_month
      t.boolean :is_finished, :null => false, :default => false
      t.text :other
      t.timestamps
    end
  end

  def self.down
    drop_table :theses
  end
end
