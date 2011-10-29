class StateOptionsController < ApplicationController
  # GET /state_options
  # GET /state_options.json
  def index
    @state_options = StateOption.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @state_options }
    end
  end

  # GET /state_options/1
  # GET /state_options/1.json
  def show
    @state_option = StateOption.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @state_option }
    end
  end

  # GET /state_options/new
  # GET /state_options/new.json
  def new
    @state_option = StateOption.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json => @state_option }
    end
  end

  # GET /state_options/1/edit
  def edit
    @state_option = StateOption.find(params[:id])
  end

  # POST /state_options
  # POST /state_options.json
  def create
    @state_option = StateOption.new(params[:state_option])

    respond_to do |format|
      if @state_option.save
        format.html { redirect_to @state_option, :notice => 'State option was successfully created.' }
        format.json { render :json => @state_option, :status => :created, :location => @state_option }
      else
        format.html { render :action => "new" }
        format.json { render :json => @state_option.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /state_options/1
  # PUT /state_options/1.json
  def update
    @state_option = StateOption.find(params[:id])

    respond_to do |format|
      if @state_option.update_attributes(params[:state_option])
        format.html { redirect_to @state_option, :notice => 'State option was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @state_option.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /state_options/1
  # DELETE /state_options/1.json
  def destroy
    @state_option = StateOption.find(params[:id])
    @state_option.destroy

    respond_to do |format|
      format.html { redirect_to state_options_url }
      format.json { head :ok }
    end
  end
end
