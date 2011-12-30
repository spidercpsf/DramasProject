class Drama < ActiveRecord::Base
	belongs_to :genre
	has_many :cast
    has_many :cast_drama
    has_many :like
    has_many :user
    def cast_num
        listCast=self.cast_drama
        return listCast.length
    end 
    def cast_list
        listCast=self.cast_drama
        casts = []
        listCast.each do |a|
            casts= casts+  [a.cast.name]
        end
        return casts
    end
    def like_num
        listLike=self.like
        return listLike.length
    end 
    def like_list
        listLike=self.like
        users = []
        listLike.each do |a|
            users= users+  [a.user.name]
        end
        return casts
    end
    def is_like(user_id)
        tmp = Like.find(:all, :conditions => "drama_id = #{self.id} and user_id = #{user_id}")
        if tmp.length > 0
            return true
        else
            return false
        end
    end
    def listMostLike
        numLikeArr = []
        for Drama.all.each do |a|
            numLikeArr = numLikeArr + [a.like.length]
        end
        
    end
end
