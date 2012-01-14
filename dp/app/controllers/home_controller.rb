class HomeController < ApplicationController
  def index
    if !user_signed_in?
        if !admin_signed_in?        
            redirect_to (new_user_session_path)
            return
        end
    end
      @dramas=Drama.all
      @dramas_sort_like = Drama.find(:all).sort_by{|p| -p.like_num}
      @dramas_sort_view = Drama.find(:all).sort_by{|p| -p.view}
      @dramas_sort_comment = Drama.find(:all).sort_by{|p| -p.comment.length}
      @allcom = Array.new
      current_user.drama.each do |d|
        com = d.comment  
        l = com.length
        if l > 0
          @allcom = @allcom << com[l-1]
        end 
       end  
       @allcom = @allcom.sort{|a,b| b.created_at <=> a.created_at }
  end

end
