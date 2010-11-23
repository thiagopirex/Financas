class GanhosController < ApplicationController
  before_filter :require_user

  
  # GET /ganhos
  # GET /ganhos.xml
  
  
  def index
    @ganhos = Ganho.find_by_user(current_user)

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @ganhos }
    end
  end

  # GET /ganhos/1
  # GET /ganhos/1.xml
  def show
    @ganho = Ganho.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @ganho }
    end
  end

  # GET /ganhos/new
  # GET /ganhos/new.xml
  def new
    @ganho = Ganho.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @ganho }
    end
  end

  # GET /ganhos/1/edit
  def edit
    @ganho = Ganho.find(params[:id])
  end

  # POST /ganhos
  # POST /ganhos.xml
  def create
    @ganho = Ganho.new(params[:ganho])

    #associa o ganho ao usuario logado    
    @ganho.user_id = current_user.id
    respond_to do |format|
      if @ganho.save
        format.html { redirect_to(@ganho, :notice => 'Ganho gravado com sucesso.') }
        format.xml  { render :xml => @ganho, :status => :created, :location => @ganho }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @ganho.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /ganhos/1
  # PUT /ganhos/1.xml
  def update
    @ganho = Ganho.find(params[:id])

    respond_to do |format|
      if @ganho.update_attributes(params[:ganho])
        format.html { redirect_to(@ganho, :notice => 'Ganho atualizado com sucesso.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @ganho.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /ganhos/1
  # DELETE /ganhos/1.xml
  def destroy
    @ganho = Ganho.find(params[:id])
    @ganho.destroy

    respond_to do |format|
      format.html { redirect_to(ganhos_url) }
      format.xml  { head :ok }
    end
  end
end
