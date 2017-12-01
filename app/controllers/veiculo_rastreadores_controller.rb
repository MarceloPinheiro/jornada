class VeiculoRastreadoresController < ApplicationController
  before_action :set_veiculo_rastreador, only: [:show, :edit, :update, :destroy]

  # GET /veiculo_rastreadores
  # GET /veiculo_rastreadores.json
  def index
    v = params[:id]
    @veiculo = Veiculo.find(v)
    @veiculo_rastreadores = VeiculoRastreador.where('veiculo_id=?',@veiculo.id)
  end

  # GET /veiculo_rastreadores/1
  # GET /veiculo_rastreadores/1.json
  def show
  end

  # GET /veiculo_rastreadores/new
  def new
    v = params[:id]
    @veiculo = Veiculo.find(v)
    @veiculo_rastreador = VeiculoRastreador.new
  end

  # GET /veiculo_rastreadores/1/edit
  def edit
  end

  # POST /veiculo_rastreadores
  # POST /veiculo_rastreadores.json
  def create
    @veiculo_rastreador = VeiculoRastreador.new(veiculo_rastreador_params)

    respond_to do |format|
      if @veiculo_rastreador.save
        format.html { redirect_to @veiculo_rastreador, notice: 'Veiculo rastreador was successfully created.' }
        format.json { render :show, status: :created, location: @veiculo_rastreador }
      else
        format.html { render :new }
        format.json { render json: @veiculo_rastreador.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /veiculo_rastreadores/1
  # PATCH/PUT /veiculo_rastreadores/1.json
  def update
    respond_to do |format|
      if @veiculo_rastreador.update(veiculo_rastreador_params)
        format.html { redirect_to @veiculo_rastreador, notice: 'Veiculo rastreador was successfully updated.' }
        format.json { render :show, status: :ok, location: @veiculo_rastreador }
      else
        format.html { render :edit }
        format.json { render json: @veiculo_rastreador.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /veiculo_rastreadores/1
  # DELETE /veiculo_rastreadores/1.json
  def destroy
    @veiculo_rastreador.destroy
    respond_to do |format|
      format.html { redirect_to veiculo_rastreadores_url, notice: 'Veiculo rastreador was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_veiculo_rastreador
      @veiculo_rastreador = VeiculoRastreador.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def veiculo_rastreador_params
      params.require(:veiculo_rastreador).permit(:veiculo_id, :rastreador_id, :status)
    end
end
