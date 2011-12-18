class CreateDramas < ActiveRecord::Migration
  def self.up
    create_table :dramas do |t|
      t.string :name
      t.integer :genre_id
      t.string :info
      t.float :rating
      t.string :episode

      t.timestamps
    end
  end

  def self.down
    drop_table :dramas
  end
end
