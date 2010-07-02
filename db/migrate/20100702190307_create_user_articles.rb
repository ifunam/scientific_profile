class CreateUserArticles < ActiveRecord::Migration
  def self.up
    create_table :user_articles do |t|
      t.references :user, :article, :null => false
      t.boolean :is_main_author, :null => false, :default => true
      t.timestamps
    end
  end

  def self.down
    drop_table :user_articles
  end
end
