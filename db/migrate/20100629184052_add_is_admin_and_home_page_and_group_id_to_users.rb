
class AddIsAdminAndHomePageAndGroupIdToUsers < ActiveRecord::Migration
  def self.up
    add_column :users, :is_admin, :boolean, :default => false
    add_column :users, :home_page, :string
    add_column :users, :group_id, :integer
  end

  def self.down
    remove_column :users, :group_id
    remove_column :users, :home_page
    remove_column :users, :is_admin
  end
end
