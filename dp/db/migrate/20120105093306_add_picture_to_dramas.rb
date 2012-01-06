class AddPictureToDramas < ActiveRecord::Migration
  def self.up
    add_column :dramas, :picture_data, :binary
    add_column :dramas, :content_type, :string
  end

  def self.down
    remove_column :dramas, :content_type
    remove_column :dramas, :picture_data
  end
end
