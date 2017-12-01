class PageController < ApplicationController
  def index

  end

  def jornada
  	@data_inicial = params[:datai].to_datetime
  	@data_final = params[:dataf].to_datetime
  	@motorista = params[:motorista]

  	@jornada = ActiveRecord::Base.connection.select_all("select * from relatorio_jornada('"+@motorista+"','"+@data_inicial.strftime('%Y-%m-%d')+" 00:00:00','"+@data_final.strftime('%Y-%m-%d')+" 23:59:59')")

  	respond_to do |format|
  		format.js
  	end
  end

  def jornadaex

	@data_inicial = params[:datai].to_datetime
  	@data_final = params[:dataf].to_datetime
  	@motorista = params[:motorista]

  	@jornada = ActiveRecord::Base.connection.select_all("select * from relatorio_jornada('"+@motorista+"','"+@data_inicial.strftime('%Y-%m-%d')+" 00:00:00','"+@data_final.strftime('%Y-%m-%d')+" 23:59:59')")

  	respond_to do |format|
  		format.xlsx{
			response.headers['Content-Disposition'] = 'attachment; filename="jornada.xlsx"'
		}
  	end


  end

end
