class PontoParadasController < ApplicationController
  before_action :set_ponto_parada, only: [:show, :edit, :update, :destroy]

  # GET /ponto_paradas
  # GET /ponto_paradas.json
  def index
    @ponto_paradas = PontoParada.all
  end

  # GET /ponto_paradas/1
  # GET /ponto_paradas/1.json
  def show
  end

  # GET /ponto_paradas/new
  def new
    @ponto_parada = PontoParada.new
  end

  # GET /ponto_paradas/1/edit
  def edit
  end

  # POST /ponto_paradas
  # POST /ponto_paradas.json
  def create
    @ponto_parada = PontoParada.new(ponto_parada_params)

    respond_to do |format|
      if @ponto_parada.save
        format.html { redirect_to @ponto_parada, notice: 'Ponto parada was successfully created.' }
        format.json { render :show, status: :created, location: @ponto_parada }
      else
        format.html { render :new }
        format.json { render json: @ponto_parada.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /ponto_paradas/1
  # PATCH/PUT /ponto_paradas/1.json
  def update
    respond_to do |format|
      if @ponto_parada.update(ponto_parada_params)
        format.html { redirect_to @ponto_parada, notice: 'Ponto parada was successfully updated.' }
        format.json { render :show, status: :ok, location: @ponto_parada }
      else
        format.html { render :edit }
        format.json { render json: @ponto_parada.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /ponto_paradas/1
  # DELETE /ponto_paradas/1.json
  def destroy
    @ponto_parada.destroy
    respond_to do |format|
      format.html { redirect_to ponto_paradas_url, notice: 'Ponto parada was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_ponto_parada
      @ponto_parada = PontoParada.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def ponto_parada_params
      params.require(:ponto_parada).permit(:descricao, :tipo_parada_id, :latitude, :longitude, :raio)
    end
end
