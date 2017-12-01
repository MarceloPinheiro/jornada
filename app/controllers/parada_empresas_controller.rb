class ParadaEmpresasController < ApplicationController
  before_action :set_parada_empresa, only: [:show, :edit, :update, :destroy]

  # GET /parada_empresas
  # GET /parada_empresas.json
  def index
    @parada_empresas = ParadaEmpresa.all
  end

  # GET /parada_empresas/1
  # GET /parada_empresas/1.json
  def show
  end

  # GET /parada_empresas/new
  def new
    @parada_empresa = ParadaEmpresa.new
  end

  # GET /parada_empresas/1/edit
  def edit
  end

  # POST /parada_empresas
  # POST /parada_empresas.json
  def create
    @parada_empresa = ParadaEmpresa.new(parada_empresa_params)

    respond_to do |format|
      if @parada_empresa.save
        format.html { redirect_to @parada_empresa, notice: 'Parada empresa was successfully created.' }
        format.json { render :show, status: :created, location: @parada_empresa }
      else
        format.html { render :new }
        format.json { render json: @parada_empresa.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /parada_empresas/1
  # PATCH/PUT /parada_empresas/1.json
  def update
    respond_to do |format|
      if @parada_empresa.update(parada_empresa_params)
        format.html { redirect_to @parada_empresa, notice: 'Parada empresa was successfully updated.' }
        format.json { render :show, status: :ok, location: @parada_empresa }
      else
        format.html { render :edit }
        format.json { render json: @parada_empresa.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /parada_empresas/1
  # DELETE /parada_empresas/1.json
  def destroy
    @parada_empresa.destroy
    respond_to do |format|
      format.html { redirect_to parada_empresas_url, notice: 'Parada empresa was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_parada_empresa
      @parada_empresa = ParadaEmpresa.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def parada_empresa_params
      params.require(:parada_empresa).permit(:ponto_parada_id, :empresa_id)
    end
end
