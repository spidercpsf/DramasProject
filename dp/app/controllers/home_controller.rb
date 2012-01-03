class HomeController < ApplicationController
  def index
    if !user_signed_in?
        redirect_to (new_user_session_path)
        return
    end
      @dramas=Drama.all
      @dramas_sort_like = Drama.find(:all).sort_by{|p| p.like_num}
      @dramas_sort_view = Drama.find(:all).sort_by{|p| p.view}
      @dramas_sort_comment = Drama.find(:all).sort_by{|p| p.comment.length}
  end

end
