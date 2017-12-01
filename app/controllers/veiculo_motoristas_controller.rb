class VeiculoMotoristasController < ApplicationController
  before_action :set_veiculo_motorista, only: [:show, :edit, :update, :destroy]

  # GET /veiculo_motoristas
  # GET /veiculo_motoristas.json
  def index
    v = params[:id]
    @veiculo = Veiculo.find(v)
    @veiculo_motoristas = VeiculoMotorista.where('veiculo_id=?',@veiculo.id)
  end

  # GET /veiculo_motoristas/1
  # GET /veiculo_motoristas/1.json
  def show
  end

  # GET /veiculo_motoristas/new
  def new
    v = params[:id]
    @veiculo = Veiculo.find(v)
    @veiculo_motorista = VeiculoMotorista.new
  end

  # GET /veiculo_motoristas/1/edit
  def edit
  end

  # POST /veiculo_motoristas
  # POST /veiculo_motoristas.json
  def create
    @veiculo_motorista = VeiculoMotorista.new(veiculo_motorista_params)

    respond_to do |format|
      if @veiculo_motorista.save
        format.html { redirect_to @veiculo_motorista, notice: 'Veiculo motorista was successfully created.' }
        format.json { render :show, status: :created, location: @veiculo_motorista }
      else
        format.html { render :new }
        format.json { render json: @veiculo_motorista.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /veiculo_motoristas/1
  # PATCH/PUT /veiculo_motoristas/1.json
  def update
    respond_to do |format|
      if @veiculo_motorista.update(veiculo_motorista_params)
        format.html { redirect_to @veiculo_motorista, notice: 'Veiculo motorista was successfully updated.' }
        format.json { render :show, status: :ok, location: @veiculo_motorista }
      else
        format.html { render :edit }
        format.json { render json: @veiculo_motorista.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /veiculo_motoristas/1
  # DELETE /veiculo_motoristas/1.json
  def destroy
    @veiculo_motorista.destroy
    respond_to do |format|
      format.html { redirect_to veiculo_motoristas_url, notice: 'Veiculo motorista was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_veiculo_motorista
      @veiculo_motorista = VeiculoMotorista.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def veiculo_motorista_params
      params.require(:veiculo_motorista).permit(:veiculo_id, :motorista_id, :status)
    end
end
