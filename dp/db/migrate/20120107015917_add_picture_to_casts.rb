class AddPictureToCasts < ActiveRecord::Migration
  def self.up
    add_column :casts, :picture_data, :binary
    add_column :casts, :content_type, :string
  end

  def self.down
    remove_column :casts, :content_type
    remove_column :casts, :picture_data
  end
end
