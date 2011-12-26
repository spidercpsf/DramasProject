class HomeController < ApplicationController
  def index
      @dramas=Drama.all
  end

end
