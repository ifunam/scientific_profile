class CreateChapterTypes < ActiveRecord::Migration
  def self.up
    create_table :chapter_types do |t|
      t.string :name

      t.timestamps
    end
  end

  def self.down
    drop_table :chapter_types
  end
end
