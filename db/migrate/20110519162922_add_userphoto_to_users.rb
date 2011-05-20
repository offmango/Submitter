class AddUserphotoToUsers < ActiveRecord::Migration
  def self.up
    add_column :users, :userphoto, :string
  end

  def self.down
    remove_column :users, :userphoto
  end
end
