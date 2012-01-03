class AddViewToDramas < ActiveRecord::Migration
  def self.up
    add_column :dramas, :view, :integer
  end

  def self.down
    remove_column :dramas, :view
  end
end
