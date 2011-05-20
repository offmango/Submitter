class CreateSubmissions < ActiveRecord::Migration
  def self.up
    create_table :submissions do |t|
      t.string :name
      t.string :netid
      t.string :collection
      t.string :content_type
      t.string :portfolio

      t.timestamps
    end
  end

  def self.down
    drop_table :submissions
  end
end
