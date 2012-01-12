class DramasController < ApplicationController
  def addcast
      @check=true
      if !admin_signed_in?
          @check = false
          return
      end
        @cd = CastDrama.new(params[:cast_drama])
        @msg = "Insert unsuccessful"
        if CastDrama.find(:all, :conditions => "drama_id = #{@cd.drama_id} and cast_id = #{@cd.cast_id}").length > 0:
            @msg = "Already exited"
        else 
            if @cd.save
                @msg= "Insert successfull"
            end
        end
  end
  # GET /dramas
  # GET /dramas.xml
  def index
    @check=true
    if !admin_signed_in?
        @check = false
    end

    @dramas = Drama.all.sort_by{|a| a.name.downcase}
    @d = {}
    for i in 0..@dramas.length-1
      x = @dramas[i].name[0,1].downcase
      if x >= "a" and x <= "z" then 
        if @d[x] == nil then @d[x] = Array.new end
        @d[x] = @d[x] << i
      else 
        if @d["other"]== nil then @d["other"] = Array.new end
        @d["other"] = @d["other"] << i
      end      
    end
    @cd= CastDrama.new
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @dramas }
    end
  end
 
  # GET /dramas/1
  # GET /dramas/1.xml
  def show
    @drama = Drama.find(params[:id])
    if @drama.view == nil
        @drama.view =0
    end
    @drama.view =@drama.view + 1
    @drama.save
    @cd= CastDrama.new
    @cmt = Comment.new
    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @drama }
    end
  end

  # GET /dramas/new
  # GET /dramas/new.xml
  def new
    @check=true
    if !admin_signed_in?
        @check = false
        redirect_to (:controller => :home, :action => :index)
        return
    end
      
    @drama= Drama.new
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @drama }
    end
  end

  # GET /dramas/1/edit
  def edit
    @check=true
    if !admin_signed_in?
        @check = false
        redirect_to (:controller => :home, :action => :index)
        return
    end

    @drama = Drama.find(params[:id])
  end

  # POST /dramas
  # POST /dramas.xml
  def create
    @check=true
    if !admin_signed_in?
        @check = false
        redirect_to (:controller => :home, :action => :index)
        return
    end

    @drama = Drama.new(params[:drama])

    respond_to do |format|
      if @drama.save
        format.html { redirect_to(@drama, :notice => 'Drama was successfully created.') }
        format.xml  { render :xml => @drama, :status => :created, :location => @drama }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @drama.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /dramas/1
  # PUT /dramas/1.xml
  def update
    @check=true
    if !admin_signed_in?
        @check = false
        redirect_to (:controller => :home, :action => :index)
        return
    end

    @drama = Drama.find(params[:id])
        
    respond_to do |format|
      if @drama.update_attributes(params[:drama])
        format.html { redirect_to(@drama, :notice => 'Drama was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @drama.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /dramas/1
  # DELETE /dramas/1.xml
  def destroy
    @check=true
    if !admin_signed_in?
        @check = false
        redirect_to (:controller => :home, :action => :index)
        return
    end

    @drama = Drama.find(params[:id])
      #delete all related object
      @listCast1 = @drama.cast_drama
      @listCast1.each do |@C|
          @C.destroy
      end

    @drama.destroy

    respond_to do |format|
      format.html { redirect_to(dramas_url) }
      format.xml  { head :ok }
    end
  end
  def like
      if !user_signed_in?
          redirect_to (new_user_session_path)
          return
      end
      @id= params[:id]
      @id_u = current_user.id
      @like = Like.new(:user_id => @id_u , :drama_id => @id)
      @drama = Drama.find(@id)
      @msg = "Insert unsuccessful"
      tmp = Like.find(:all, :conditions => "drama_id = #{@id} and user_id = #{@id_u}")
      if tmp.length > 0
            @msg = "Already exited"
            tmp[0].destroy
      else 
            if @like.save
                @msg= "Insert successfull"
            else
                @msg=  "Cannot insert"
            end
      end
      #redirect_to (:controller => :home, :action => :index)
      respond_to do |format|
        format.html {redirect_to (@drama)}
        format.js
      end 
  end
  def picture
    @drama = Drama.find(params[:id])
    send_data(@drama.picture_data, :type => @drama.content_type)
  end
end
