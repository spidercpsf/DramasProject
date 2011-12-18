class CreateDramas < ActiveRecord::Migration
  def self.up
    create_table :dramas do |t|
      t.string :name
      t.string :info
      t.string :cast
      t.string :genre
      t.float :rating
      t.string :episode

      t.timestamps
    end
  end

  def self.down
    drop_table :dramas
  end
end
