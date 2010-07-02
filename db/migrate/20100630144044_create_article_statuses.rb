class CreateArticleStatuses < ActiveRecord::Migration
  def self.up
    create_table :article_statuses do |t|
      t.string :name

      t.timestamps
    end
  end

  def self.down
    drop_table :article_statuses
  end
end
