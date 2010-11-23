class GastosController < ApplicationController
  before_filter :require_user

  # GET /gastos
  # GET /gastos.xml
  def index
    @Total = 0
    @gastos = Gasto.find_by_user(current_user)

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @gastos }
    end
  end

  # GET /gastos/1
  # GET /gastos/1.xml
  def show
    @gasto = Gasto.find(params[:id])
    
    if @gasto.user_id == current_user.id
      respond_to do |format|
        format.html # show.html.erb
        format.xml  { render :xml => @gasto }
      end
    else
      redirect_to :gastos
    end
  end

  # GET /gastos/new
  # GET /gastos/new.xml
  def new
    @gasto = Gasto.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @gasto }
    end
  end

  # GET /gastos/1/edit
  def edit
    @gasto = Gasto.find(params[:id])
  end

  # POST /gastos
  # POST /gastos.xml
  def create
    @gasto = Gasto.new(params[:gasto])

    #associa o gasto ao usuario logado    
    @gasto.user_id = current_user.id

    respond_to do |format|
      if @gasto.save
        format.html { redirect_to(@gasto, :notice => 'Inclusao de gasto feita com sucesso.') }
        format.xml  { render :xml => @gasto, :status => :created, :location => @gasto }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @gasto.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /gastos/1
  # PUT /gastos/1.xml
  def update
    @gasto = Gasto.find(params[:id])

    respond_to do |format|
      if @gasto.update_attributes(params[:gasto])
        format.html { redirect_to(@gasto, :notice => 'Atualizacao de gasto feita com sucesso.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @gasto.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /gastos/1
  # DELETE /gastos/1.xml
  def destroy
    @gasto = Gasto.find(params[:id])
    @gasto.destroy

    respond_to do |format|
      format.html { redirect_to(gastos_url) }
      format.xml  { head :ok }
    end
  end
end
