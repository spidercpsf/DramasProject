class DramasController < ApplicationController
  # GET /dramas
  # GET /dramas.xml
  def index
    @dramas = Drama.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @dramas }
    end
  end

  # GET /dramas/1
  # GET /dramas/1.xml
  def show
    @drama = Drama.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @drama }
    end
  end

  # GET /dramas/new
  # GET /dramas/new.xml
  def new
    @drama = Drama.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @drama }
    end
  end

  # GET /dramas/1/edit
  def edit
    @drama = Drama.find(params[:id])
  end

  # POST /dramas
  # POST /dramas.xml
  def create
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
    @drama = Drama.find(params[:id])
    @drama.destroy

    respond_to do |format|
      format.html { redirect_to(dramas_url) }
      format.xml  { head :ok }
    end
  end
end
