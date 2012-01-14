class Cast < ActiveRecord::Base
    has_many :drama 
    has_many :cast_drama
end
