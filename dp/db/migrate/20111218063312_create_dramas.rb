class CreateDramas < ActiveRecord::Migration
  def self.up
    create_table :dramas do |t|
      t.string :name
      t.integer :genre_id
      t.text :info
      t.float :rating
      t.string :episode
      t.integer :view
      t.binary :picture_data
      t.string :content_type
    
      t.timestamps
    end
  end

  def self.down
    drop_table :dramas
  end
end
