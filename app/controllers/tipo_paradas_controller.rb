class TipoParadasController < ApplicationController
  before_action :set_tipo_parada, only: [:show, :edit, :update, :destroy]

  # GET /tipo_paradas
  # GET /tipo_paradas.json
  def index
    @tipo_paradas = TipoParada.all
  end

  # GET /tipo_paradas/1
  # GET /tipo_paradas/1.json
  def show
  end

  # GET /tipo_paradas/new
  def new
    @tipo_parada = TipoParada.new
  end

  # GET /tipo_paradas/1/edit
  def edit
  end

  # POST /tipo_paradas
  # POST /tipo_paradas.json
  def create
    @tipo_parada = TipoParada.new(tipo_parada_params)

    respond_to do |format|
      if @tipo_parada.save
        format.html { redirect_to @tipo_parada, notice: 'Tipo parada was successfully created.' }
        format.json { render :show, status: :created, location: @tipo_parada }
      else
        format.html { render :new }
        format.json { render json: @tipo_parada.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tipo_paradas/1
  # PATCH/PUT /tipo_paradas/1.json
  def update
    respond_to do |format|
      if @tipo_parada.update(tipo_parada_params)
        format.html { redirect_to @tipo_parada, notice: 'Tipo parada was successfully updated.' }
        format.json { render :show, status: :ok, location: @tipo_parada }
      else
        format.html { render :edit }
        format.json { render json: @tipo_parada.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tipo_paradas/1
  # DELETE /tipo_paradas/1.json
  def destroy
    @tipo_parada.destroy
    respond_to do |format|
      format.html { redirect_to tipo_paradas_url, notice: 'Tipo parada was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_tipo_parada
      @tipo_parada = TipoParada.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def tipo_parada_params
      params.require(:tipo_parada).permit(:descricao)
    end
end
