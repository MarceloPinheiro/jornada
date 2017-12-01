class MotoristasController < ApplicationController
  before_action :set_motorista, only: [:show, :edit, :update, :destroy]

  # GET /motoristas
  # GET /motoristas.json
  def index
    @motoristas = Motorista.all
  end

  # GET /motoristas/1
  # GET /motoristas/1.json
  def show
  end

  # GET /motoristas/new
  def new
    @motorista = Motorista.new
  end

  # GET /motoristas/1/edit
  def edit
  end

  # POST /motoristas
  # POST /motoristas.json
  def create
    @motorista = Motorista.new(motorista_params)

    respond_to do |format|
      if @motorista.save
        format.html { redirect_to @motorista, notice: 'Motorista was successfully created.' }
        format.json { render :show, status: :created, location: @motorista }
      else
        format.html { render :new }
        format.json { render json: @motorista.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /motoristas/1
  # PATCH/PUT /motoristas/1.json
  def update
    respond_to do |format|
      if @motorista.update(motorista_params)
        format.html { redirect_to @motorista, notice: 'Motorista was successfully updated.' }
        format.json { render :show, status: :ok, location: @motorista }
      else
        format.html { render :edit }
        format.json { render json: @motorista.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /motoristas/1
  # DELETE /motoristas/1.json
  def destroy
    @motorista.destroy
    respond_to do |format|
      format.html { redirect_to motoristas_url, notice: 'Motorista was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def autocomplete

    @motorista = Motorista.where("nome ilike ?","%#{params[:term]}%").select("nome")
    respond_to do |format|
      format.json{
        render json: @motorista.map(&:nome)
      }
    end
  end



  private
    # Use callbacks to share common setup or constraints between actions.
    def set_motorista
      @motorista = Motorista.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def motorista_params
      params.require(:motorista).permit(:nome, :cnh, :telefone, :email, :cpf, :empresa_id)
    end
end
