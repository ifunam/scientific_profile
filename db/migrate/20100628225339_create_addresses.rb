class CreateAddresses < ActiveRecord::Migration
  def self.up
    create_table :addresses do |t|
      t.references :user
      t.text :location, :pobox
      t.string :country, :state, :city, :zipcode, :phone, :fax, :mobile
      t.timestamps
    end
  end

  def self.down
    drop_table :addresses
  end
end
