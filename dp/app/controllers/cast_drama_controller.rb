class CastDramaController < ApplicationController
  def new
  end
    # DELETE /castdramas/1
    # DELETE /castdramas/1.xml
    def destroy
        @cd = CastDrama.find(params[:id])
        @cd.destroy
        
        respond_to do |format|
            format.html { redirect_to(castdramas_url) }
            format.xml  { head :ok }
        end
    end

end
