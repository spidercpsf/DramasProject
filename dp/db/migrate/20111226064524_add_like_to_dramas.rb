class AddLikeToDramas < ActiveRecord::Migration
  def self.up
    add_column :dramas, :like, :integer
  end

  def self.down
    remove_column :dramas, :like
  end
end
