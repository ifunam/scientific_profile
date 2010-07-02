class CreateArticles < ActiveRecord::Migration
  def self.up
    create_table :articles do |t|
      t.references :journal, :article_status, :null => false
      t.integer :year, :null => false
      t.integer :month
      t.text :title, :authors, :null => false
      t.text :pages, :vol, :num, :url, :pacsnum, :doi, :url, :other
      t.references :moduser, :class_name => 'User', :foreign_key => 'moduser_id'
      t.timestamps
      t.timestamps
    end
  end

  def self.down
    drop_table :articles
  end
end
