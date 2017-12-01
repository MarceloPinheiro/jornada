class ViagensController < ApplicationController
  before_action :set_viagem, only: [:show, :edit, :update, :destroy]

  # GET /viagens
  # GET /viagens.json
  def index
    @viagens = Viagem.all
  end

  # GET /viagens/1
  # GET /viagens/1.json
  def show
  end

  # GET /viagens/new
  def new
    @viagem = Viagem.new
  end

  # GET /viagens/1/edit
  def edit
  end

  # POST /viagens
  # POST /viagens.json
  def create
    @viagem = Viagem.new(viagem_params)

    respond_to do |format|
      if @viagem.save
        format.html { redirect_to @viagem, notice: 'Viagem was successfully created.' }
        format.json { render :show, status: :created, location: @viagem }
      else
        format.html { render :new }
        format.json { render json: @viagem.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /viagens/1
  # PATCH/PUT /viagens/1.json
  def update
    respond_to do |format|
      if @viagem.update(viagem_params)
        format.html { redirect_to @viagem, notice: 'Viagem was successfully updated.' }
        format.json { render :show, status: :ok, location: @viagem }
      else
        format.html { render :edit }
        format.json { render json: @viagem.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /viagens/1
  # DELETE /viagens/1.json
  def destroy
    @viagem.destroy
    respond_to do |format|
      format.html { redirect_to viagens_url, notice: 'Viagem was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def viagem
    respond_to do |format|
      format.js
    end
  end

  def cria_viagem

    @viagem = Viagem.new
    @viagem.veiculo_id = params[:veiculo]
    @viagem.origem = params[:origem]
    @viagem.destino = params[:destino]
    @viagem.data_inicio = Date.today
    @viagem.data_fim = params[:data_fim]
    @viagem.save

    respond_to do |format|
      format.js
    end

  end

  def impcsv

    @arq = params[:impcsv][:arq].read
    @nome_or = Date.today.to_s[0..3]+params[:impcsv][:arq].original_filename
    path = File.join(Rails.root,"app/assets/images/arquivos",@nome_or)
    File.open(path, "wb") do |f|
      f.write(@arq)
    end

    #tudo = Dir[Rails.root+'app/assets/images/arquivos/*']

    #Rails.logger.debug("Tudo #{tudo}")

    #tudo.each do |file_name|
      #Rails.logger.debug("Dados do Arquivo #{file_name}")
      #path = File.join(Rails.root,"app/assets/images/arquivos",file_name)
      File.open(path, "r").each_line do |linha|

        @dados = linha.split(";")
        if(@dados.length() == 19)
          placa = @dados[0]
          dispositivo = @dados[1]
          fabricante = @dados[2]
          data = @dados[4]
          data_lancamento = @dados[5]
          local = @dados[15]
          motor = (@dados[6] == "Desligada" ? 0 : 1)
          velocidade = @dados[8]
          altitude = (@dados[9].blank? ? 0 : @dados[9])
          latitude = (@dados[17].blank? ? 0 : @dados[17])
          longitude = (@dados[18].blank? ? 0 : @dados[18])
          if(@dados[16].include? " - ")
            motorista_arr = @dados[16].split(" - ")
            motorista = motorista_arr[1]
          else
            motorista = @dados[16]
          end

          if(placa != "Placa")
        
	   data1 = DateTime.new(data[6..9].to_i,data[3..4].to_i,data[0..1].to_i,data[11..12].to_i,data[14..15].to_i,data[17..18].to_i)
           data2 = DateTime.new(data_lancamento[6..9].to_i,data_lancamento[3..4].to_i,data_lancamento[0..1].to_i,data_lancamento[11..12].to_i,data_lancamento[14..15].to_i,data_lancamento[17..18].to_i)

            #Validando o Veiculo
            @veiculo = Veiculo.where("placa=?",placa).first_or_create(:placa => placa,:status => 1,:empresa_id => 2)

            @motorista = Motorista.where("nome=?",motorista).first_or_create(:nome => motorista,:empresa_id => 2,:status => 1)

            @evento = Evento.where("veiculo_id=? and motorista_id=? and data_evento=to_timestamp(?,'DD/MM/YYYY HH24:MI:SS') and data_lancamento=to_timestamp(?,'DD/MM/YYYY HH24:MI:SS') and local=? and motor=? and velocidade=? and altitude=? and latitude=? and longitude=?",@veiculo.id,@motorista.id,data,data_lancamento,local,motor,velocidade,altitude,latitude,longitude).first_or_create(:veiculo_id => @veiculo.id,:motorista_id => @motorista.id,:data_evento => data1,:data_lancamento => data2,:local => local, :motor => motor, :velocidade => velocidade, :altitude => altitude, :latitude => latitude, :longitude => longitude)
        
            Rails.logger.debug("(#{@veiculo.id},#{@motorista.id},to_timestamp('#{data}','DD/MM/YYYY HH:MI:SS'),to_timestamp('#{data_lancamento}','DD/MM/YYYY HH:MI:SS'),'#{local}',#{motor},#{velocidade},#{altitude},#{latitude},#{longitude})")
          end
        end

      #end
    end

    redirect_to '/'

  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_viagem
      @viagem = Viagem.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def viagem_params
      params.require(:viagem).permit(:veiculo_id, :origem, :destino, :data_inicio, :data_fim)
    end
end
