class CastDrama < ActiveRecord::Base
    belongs_to :drama
	belongs_to :cast
end
