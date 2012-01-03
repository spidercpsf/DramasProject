class CreateComments < ActiveRecord::Migration
  def self.up
    create_table :comments do |t|
      t.integer :user_id
      t.integer :drama_id
      t.string :comment

      t.timestamps
    end
  end

  def self.down
    drop_table :comments
  end
end
