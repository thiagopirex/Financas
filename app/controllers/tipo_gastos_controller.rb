class TipoGastosController < ApplicationController
  before_filter :require_user

  # GET /tipo_gastos
  # GET /tipo_gastos.xml
  def index
    @tipo_gastos = TipoGasto.find_by_user(current_user)

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @tipo_gastos }
    end
  end

  # GET /tipo_gastos/1
  # GET /tipo_gastos/1.xml
  def show
    @tipo_gasto = TipoGasto.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @tipo_gasto }
    end
  end

  # GET /tipo_gastos/new
  # GET /tipo_gastos/new.xml
  def new
    @tipo_gasto = TipoGasto.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @tipo_gasto }
    end
  end

  # GET /tipo_gastos/1/edit
  def edit
    @tipo_gasto = TipoGasto.find(params[:id])
  end

  # POST /tipo_gastos
  # POST /tipo_gastos.xml
  def create
    @tipo_gasto = TipoGasto.new(params[:tipo_gasto])
    
    #associa o tipo do gasto ao usuario logado    
    @tipo_gasto.user_id = current_user.id

    respond_to do |format|
      if @tipo_gasto.save
        format.html { redirect_to(@tipo_gasto, :notice => 'Tipo gasto was successfully created.') }
        format.xml  { render :xml => @tipo_gasto, :status => :created, :location => @tipo_gasto }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @tipo_gasto.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /tipo_gastos/1
  # PUT /tipo_gastos/1.xml
  def update
    @tipo_gasto = TipoGasto.find(params[:id])

    respond_to do |format|
      if @tipo_gasto.update_attributes(params[:tipo_gasto])
        format.html { redirect_to(@tipo_gasto, :notice => 'Tipo gasto was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @tipo_gasto.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /tipo_gastos/1
  # DELETE /tipo_gastos/1.xml
  def destroy
    @tipo_gasto = TipoGasto.find(params[:id])
    @tipo_gasto.destroy

    respond_to do |format|
      format.html { redirect_to(tipo_gastos_url) }
      format.xml  { head :ok }
    end
  end
end
