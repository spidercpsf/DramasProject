class Like < ActiveRecord::Base
  belongs_to :drama
  belongs_to :user
end
