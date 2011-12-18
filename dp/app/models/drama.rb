class Drama < ActiveRecord::Base
	belongs_to :genre
	has_many :cast
    has_many :cast_drama
end
