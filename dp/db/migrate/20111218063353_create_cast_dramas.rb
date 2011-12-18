class CreateCastDramas < ActiveRecord::Migration
  def self.up
    create_table :cast_dramas do |t|
      t.integer :drama_id
      t.integer :cast_id

      t.timestamps
    end
  end

  def self.down
    drop_table :cast_dramas
  end
end
