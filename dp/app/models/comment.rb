class Comment < ActiveRecord::Base
  belongs_to :drama
  belongs_to :user
end
