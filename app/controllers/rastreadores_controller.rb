class RastreadoresController < ApplicationController
  before_action :set_rastreador, only: [:show, :edit, :update, :destroy]

  # GET /rastreadores
  # GET /rastreadores.json
  def index
    @rastreadores = Rastreador.all
  end

  # GET /rastreadores/1
  # GET /rastreadores/1.json
  def show
  end

  # GET /rastreadores/new
  def new
    @rastreador = Rastreador.new
  end

  # GET /rastreadores/1/edit
  def edit
  end

  # POST /rastreadores
  # POST /rastreadores.json
  def create
    @rastreador = Rastreador.new(rastreador_params)

    respond_to do |format|
      if @rastreador.save
        format.html { redirect_to @rastreador, notice: 'Rastreador was successfully created.' }
        format.json { render :show, status: :created, location: @rastreador }
      else
        format.html { render :new }
        format.json { render json: @rastreador.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /rastreadores/1
  # PATCH/PUT /rastreadores/1.json
  def update
    respond_to do |format|
      if @rastreador.update(rastreador_params)
        format.html { redirect_to @rastreador, notice: 'Rastreador was successfully updated.' }
        format.json { render :show, status: :ok, location: @rastreador }
      else
        format.html { render :edit }
        format.json { render json: @rastreador.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /rastreadores/1
  # DELETE /rastreadores/1.json
  def destroy
    @rastreador.destroy
    respond_to do |format|
      format.html { redirect_to rastreadores_url, notice: 'Rastreador was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_rastreador
      @rastreador = Rastreador.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def rastreador_params
      params.require(:rastreador).permit(:marca, :modelo)
    end
end
