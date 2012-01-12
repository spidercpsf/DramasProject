class CastsController < ApplicationController
  # GET /casts
  # GET /casts.xml
  def index
    @casts = Cast.all.sort_by{|a| a.name.downcase}
    @c = {}
    for i in 0..@casts.length-1
      x = @casts[i].name[0,1].downcase
      if x >= "a" and x <= "z" then 
        if @c[x] == nil then @c[x] = Array.new end
        @c[x] = @c[x] << i
      else 
        if @c["other"]== nil then @c["other"] = Array.new end
        @c["other"] = @c["other"] << i
      end      
    end

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @casts }
    end
  end

  # GET /casts/1
  # GET /casts/1.xml
  def show
    @cast = Cast.find(params[:id])
    @cd = CastDrama.new
    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @cast }
    end
  end

  # GET /casts/new
  # GET /casts/new.xml
  def new
      @check=true
      if !admin_signed_in?
          @check = false
          redirect_to (:controller => :home, :action => :index)
          return
      end
    @cast = Cast.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @cast }
    end
  end

  # GET /casts/1/edit
  def edit
      @check=true
      if !admin_signed_in?
          @check = false
          redirect_to (:controller => :home, :action => :index)
          return
      end
    @cast = Cast.find(params[:id])
  end

  # POST /casts
  # POST /casts.xml
  def create
      @check=true
      if !admin_signed_in?
          @check = false
          redirect_to (:controller => :home, :action => :index)
          return
      end
    @cast = Cast.new(params[:cast])

    respond_to do |format|
      if @cast.save
        format.html { redirect_to(@cast, :notice => 'Cast was successfully created.') }
        format.xml  { render :xml => @cast, :status => :created, :location => @cast }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @cast.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /casts/1
  # PUT /casts/1.xml
  def update
      @check=true
      if !admin_signed_in?
          @check = false
          redirect_to (:controller => :home, :action => :index)
          return
      end
    @cast = Cast.find(params[:id])

    respond_to do |format|
      if @cast.update_attributes(params[:cast])
        format.html { redirect_to(@cast, :notice => 'Cast was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @cast.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /casts/1
  # DELETE /casts/1.xml
  def destroy
      @check=true
      if !admin_signed_in?
          @check = false
          redirect_to (:controller => :home, :action => :index)
          return
      end
    @cast = Cast.find(params[:id])
      #delete all related object
      @listFilm = @cast.cast_drama
      @listFilm.each do |@f|
          @f.destroy
      end
    @cast.destroy
    
    respond_to do |format|
      format.html { redirect_to(casts_url) }
      format.xml  { head :ok }
    end
  end
end
