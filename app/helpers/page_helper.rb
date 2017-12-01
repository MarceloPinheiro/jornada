module PageHelper

	def CalculoJornada(jornada)

		ret = "<table class='table table-striped table-hover'><thead><tr><th>Data</th><th>Inicio de Viagem</th><th>Termino de Viagem</th><th>Total Horas Viagem</th><th>Jornada</th><th>Descanso</th><th>Hora Extra</th><th>Adicional Noturno</th><th>Inter Jornada</th></tr></thead><tbody>";
		dataI = "0000-00-00"
		horaInicial = "00:00:00".to_time
		horaFinal = "00:00:00".to_time
		horaAt = "00:00:00".to_time
		horaMov = "00:00:00".to_time
		horaParada = "00:00:00".to_time
		calcM = "00:00:00".to_time
		tempoMov = "00:00:00".to_time
		hora_extraI = "00:00:00".to_time
		hora_extraG = "00:00:00".to_time
		hora_noturnaI = "00:00:00".to_time
		hora_noturnaA = "00:00:00".to_time
		hora_noturnaU = "00:00:00".to_time
		hora_noturnaG = "00:00:00".to_time
		hora_noturnaG1 = "00:00:00".to_time
		hora_noturnaG2 = "00:00:00".to_time
		hora_inter = "00:00:00".to_time
		info = 0
		arrDatas = []
		arrDados = []

		jornada.each do |viagem|
			if(dataI == viagem["datar"])
				#Rails.logger.debug("Dados #{viagem['datar']} #{viagem['horar']} #{viagem['infor']}")
				if((horaInicial == "00:00:00".to_time) && (viagem["infor"].to_i == 1))
					#Rails.logger.debug("Gravou a Hora Inicial Segundo #{viagem['datar']} #{viagem['horar']} #{viagem['infor']}")
					hri = (viagem["datar"]+" "+viagem["horar"])
					horaInicial = hri.to_time
					info = 1
				end

				if(viagem["infor"].to_i == 1)
					horaMov = viagem["horar"].to_time
					info = viagem["horar"].to_i
					
				end

				if((viagem["infor"].to_i != info) && (info != 0))
					calcM = "%.0f" % ((viagem["horar"].to_time - horaMov)/60)
					info = viagem["infor"].to_i
					hrf = (viagem["datar"]+" "+viagem["horar"])
					horaFinal = hrf.to_time
					if(calcM.to_i > 0)
						ht = calcM.to_i.minutes
						tempoMov = tempoMov + ht
					end
					#Rails.logger.debug("Dados Hora #{viagem['horar'].to_time} - #{horaMov} - #{calcM}")
				end

				if((viagem["infor"].to_i == 1) && ((viagem["horar"].to_time < "05:00:00".to_time) || (viagem["horar"].to_time > "21:59:59".to_time)))
					dataNG = viagem['datar']+" "+viagem['horar']
					if(hora_noturnaI == "00:00:00".to_time)
						hora_noturnaI = dataNG.to_time
						#hora_noturnaU = dataNG.to_time
					end
					hora_noturnaU = dataNG.to_time
					hora_noturnaA = dataNG.to_time
					#Rails.logger.debug("Dados Adicional Noturno Inicio #{viagem['datar']} #{viagem['horar']} #{hora_noturnaU}")
				end

				if((viagem["infor"].to_i == 2) && (hora_noturnaA != "00:00:00".to_time))
					han = viagem['horar']
					if((han.to_time > "04:59:59".to_time) && (han.to_time < "22:00:00".to_time))
						han = "04:59:59"
					end
					dataNG = viagem['datar']+" "+han
					hora_noturnaA = dataNG.to_time
					hora_noturnaG = CalculoHoraNoturna(hora_noturnaG,hora_noturnaA,hora_noturnaU)
					hora_noturnaG2 = CalculoHoraNoturna(hora_noturnaG2,hora_noturnaA,hora_noturnaU)
					#Rails.logger.debug("Dados Adicional Noturno Fim #{viagem['datar']} #{viagem['horar']} | #{hora_noturnaU} | #{hora_noturnaG2}")
					hora_noturnaU = hora_noturnaA
					hora_noturnaA = "00:00:00".to_time
					
				end

				horaAt = viagem["horar"].to_time
			else
				if((dataI != "0000-00-00") && (horaInicial != "00:00:00".to_time))
					#horaFinal = horaAt.to_time
					calc = Time.at(horaFinal - horaInicial)+3.hour #horaInicial + 30.minutes
					hora_extra = "00:00:00".to_time

					if ("08:00:00".to_time.strftime("%H:%M") <= tempoMov.strftime("%H:%M"))
						hora_extra = (Time.at(tempoMov - "08:00:00".to_time)+3.hour)
						hora_extraG = CalculoHoraExtra(hora_extraG,tempoMov)
						
					else
						hora_extra = "00:00".to_time
					end

					#ret += "<tr><td>"+dataI.to_date.strftime('%d/%m/%Y')+" - "+l(dataI.to_date, :format => :semana)+"</td><td>"+horaInicial.strftime("%H:%M")+"</td><td>"+horaFinal.strftime("%H:%M")+"</td><td>"+calc.strftime("%H:%M")+"</td><td>"+tempoMov.strftime("%H:%M")+"</td><td>"+(Time.at(calc - tempoMov)+3.hour).strftime("%H:%M")+"</td><td>"+hora_extra.strftime("%H:%M")+"</td><td>"+hora_noturnaG.strftime("%H:%M")+"</td><td>"+ (hora_inter == "00:00:00".to_time ? '00:00' : CalculoHora(horaInicial,hora_inter))+"</td></tr>"
					arrDatas.push ((dataI.to_datetime + 3.hour))
					arrDados.push (dataI.to_date.strftime('%d/%m/%Y')+" - "+l(dataI.to_date,:format => :semana)+";"+horaInicial.strftime("%H:%M:%S")+";"+horaFinal.strftime("%H:%M:%S")+";"+calc.strftime("%H:%M:%S")+";"+tempoMov.strftime("%H:%M:%S")+";"+(Time.at(calc - tempoMov)+3.hour).strftime("%H:%M:%S")+";"+hora_extra.strftime("%H:%M:%S")+";"+hora_noturnaG.strftime("%H:%M:%S")+";"+ (hora_inter == "00:00:00".to_time ? '00:00:00' : CalculoHora(horaInicial,hora_inter)))		
			
					#dataI = "0000-00-00"
					hora_inter = horaFinal
					horaInicial = "00:00:00".to_time
					horaFinal = "00:00:00".to_time
					horaAt = "00:00:00".to_time
					horaMov = "00:00:00".to_time
					horaParada = "00:00:00".to_time
					calcM = "00:00:00".to_time
					tempoMov = "00:00:00".to_time
					hora_noturnaI = "00:00:00".to_time
					hora_noturnaA = "00:00:00".to_time
					hora_noturnaU = "00:00:00".to_time
					hora_noturnaG = "00:00:00".to_time
					#hora_extraG = "00:00:00".to_time
					info = 0
				end
				dataI = viagem["datar"]
				if(viagem["infor"].to_i == 1)
					#Rails.logger.debug("Gravou a Hora Inicial Primeiro #{viagem['datar']} #{viagem['horar']} #{viagem['infor']}")
					hri = (viagem["datar"]+" "+viagem["horar"])
					horaInicial = hri.to_time
					horaMov = viagem["horar"].to_time
				end
					#ret += viagem["datar"]+"<br>"
				
			end
		end

		if(horaInicial != "00:00:00".to_time)
			#horaFinal = horaAt.to_time
			calc = Time.at(horaFinal - horaInicial)+3.hour #horaInicial + 30.minutes
			hora_extra = "00:00:00".to_time

			if ("08:00:00".to_time.strftime("%H:%M") <= tempoMov.strftime("%H:%M"))
				hora_extra = (Time.at(tempoMov - "08:00:00".to_time)+3.hour)
				hora_extraG = CalculoHoraExtra(hora_extraG,tempoMov)
				else
				hora_extra = "00:00".to_time
			end

			#ret += "<tr><td>"+dataI.to_date.strftime('%d/%m/%Y')+" - "+l(dataI.to_date,:format => :semana)+"</td><td>"+horaInicial.strftime("%H:%M")+"</td><td>"+horaFinal.strftime("%H:%M")+"</td><td>"+calc.strftime("%H:%M")+"</td><td>"+tempoMov.strftime("%H:%M")+"</td><td>"+(Time.at(calc - tempoMov)+3.hour).strftime("%H:%M")+"</td><td>"+hora_extra.strftime("%H:%M")+"</td><td>"+hora_noturnaG.strftime("%H:%M")+"</td><td>"+ (hora_inter == "00:00:00".to_time ? '00:00' : CalculoHora(horaInicial,hora_inter))+"</td></tr>"
			arrDatas.push ((dataI.to_datetime + 3.hour))
			arrDados.push (dataI.to_date.strftime('%d/%m/%Y')+" - "+l(dataI.to_date,:format => :semana)+";"+horaInicial.strftime("%H:%M:%S")+";"+horaFinal.strftime("%H:%M:%S")+";"+calc.strftime("%H:%M:%S")+";"+tempoMov.strftime("%H:%M:%S")+";"+(Time.at(calc - tempoMov)+3.hour).strftime("%H:%M:%S")+";"+hora_extra.strftime("%H:%M:%S")+";"+hora_noturnaG.strftime("%H:%M:%S")+";"+ (hora_inter == "00:00:00".to_time ? '00:00:00' : CalculoHora(horaInicial,hora_inter)))		
			
		end

		#hora_X = ("%.2f" % ((hora_extraG - hora_extraI)/1.hour))
		
		((@data_inicial.to_datetime + 3.hour).to_i..(@data_final.to_datetime + 3.hour).to_i).step(1.day) do |date|
			dataTeste = Time.at(date)
			found = arrDatas.detect {|dataT| dataT == dataTeste}
			if found.present?
				pega = arrDatas.index {|dataT| dataT == dataTeste}
				dadosPG = arrDados[pega].split(";")
				ret += "<tr><td>"+dadosPG[0]+"</td><td>"+dadosPG[1]+"</td><td>"+dadosPG[2]+"</td><td>"+dadosPG[3]+"</td><td>"+dadosPG[4]+"</td><td>"+dadosPG[5]+"</td><td>"+dadosPG[6]+"</td><td>"+dadosPG[7]+"</td><td>"+dadosPG[8]+"</td></tr>"
				Rails.logger.debug("Datas #{dataTeste} aqui tem dados #{dadosPG[0]}")
			else
				ret += "<tr><td>"+dataTeste.to_date.strftime('%d/%m/%Y')+" - "+l(dataTeste.to_date,:format => :semana)+"</td><td>00:00:00</td><td>00:00:00</td><td>00:00:00</td><td>00:00:00</td><td>00:00:00</td><td>00:00:00</td><td>00:00:00</td><td>00:00:00</td></tr>"
				Rails.logger.debug("Datas: #{dataTeste} - #{found}")
			end
		end

		ret += "<tr><th colspan=6></th><th>"+CalculoHora(hora_extraI,hora_extraG)+"</th><th>"+CalculoHora(hora_noturnaG1,hora_noturnaG2)+"</th></tr>"

		ret += "</tbody></table>"

		return ret.html_safe

	end


	def CalculoJornadaEx(jornada,sheet,style)

		cabecalho = style.add_style(bg_color: "2F75B5",fg_color: "FF", border: Axlsx::STYLE_THIN_BORDER, alignment: { horizontal: :center} )
		linhap = style.add_style(bg_color: "BDD7EE", border: Axlsx::STYLE_THIN_BORDER, alignment: { horizontal: :center} )
		linhape = style.add_style(bg_color: "BDD7EE", border: Axlsx::STYLE_THIN_BORDER, alignment: { horizontal: :left} )
		linhapt = style.add_style(bg_color: "BDD7EE", border: Axlsx::STYLE_THIN_BORDER, alignment: { horizontal: :center} )
		linhapet = style.add_style(bg_color: "BDD7EE", border: Axlsx::STYLE_THIN_BORDER, alignment: { horizontal: :left} )
		linhai = style.add_style(bg_color: "DDEBF7", border: Axlsx::STYLE_THIN_BORDER, alignment: { horizontal: :center} )
		linhaie = style.add_style(bg_color: "DDEBF7", border: Axlsx::STYLE_THIN_BORDER, alignment: { horizontal: :left} )
		linhait = style.add_style(bg_color: "DDEBF7", border: Axlsx::STYLE_THIN_BORDER, alignment: { horizontal: :center} )
		linhaiet = style.add_style(bg_color: "DDEBF7", border: Axlsx::STYLE_THIN_BORDER, alignment: { horizontal: :left} )
		rodape = style.add_style(bg_color: "238DEE",fg_color: "FF", border: Axlsx::STYLE_THIN_BORDER, alignment: { horizontal: :center})

		#ret = "<table class='table table-striped table-hover'><thead><tr><th>Data</th><th>Inicio de Viagem</th><th>Termino de Viagem</th><th>Total Horas Viagem</th><th>Jornada</th><th>Descanso</th><th>Hora Extra</th><th>Adicional Noturno</th><th>Inter Jornada</th></tr></thead><tbody>";
		sheet.add_row ["Data", "Inicio de Viagem", "Termino de Viagem", "Total Horas Viagem", "Jornada", "Descanso", "Hora Extra", "Adicional Noturno", "Inter Jornada","Tempo de Espera","Descanso Semanal"], style: [cabecalho,cabecalho,cabecalho,cabecalho,cabecalho,cabecalho,cabecalho,cabecalho,cabecalho,cabecalho,cabecalho]
		dataI = "0000-00-00"
		horaInicial = "00:00:00".to_time
		horaFinal = "00:00:00".to_time
		horaAt = "00:00:00".to_time
		horaMov = "00:00:00".to_time
		horaParada = "00:00:00".to_time
		calcM = "00:00:00".to_time
		tempoMov = "00:00:00".to_time
		hora_extraI = "00:00:00".to_time
		hora_extraG = "00:00:00".to_time
		hora_noturnaI = "00:00:00".to_time
		hora_noturnaA = "00:00:00".to_time
		hora_noturnaU = "00:00:00".to_time
		hora_noturnaG = "00:00:00".to_time
		hora_noturnaG1 = "00:00:00".to_time
		hora_noturnaG2 = "00:00:00".to_time
		hora_inter = "00:00:00".to_time
		info = 0
		arrDatas = []
		arrDados = []
		

		intp = 1

		jornada.each do |viagem|
			if(dataI == viagem["datar"])
				#Rails.logger.debug("Dados #{viagem['datar']} #{viagem['horar']} #{viagem['infor']}")
				if((horaInicial == "00:00:00".to_time) && (viagem["infor"].to_i == 1))
					#Rails.logger.debug("Gravou a Hora Inicial Segundo #{viagem['datar']} #{viagem['horar']} #{viagem['infor']}")
					hri = (viagem["datar"]+" "+viagem["horar"])
					horaInicial = hri.to_time
					info = 1
				end

				if(viagem["infor"].to_i == 1)
					horaMov = viagem["horar"].to_time
					info = viagem["horar"].to_i
					
				end

				if((viagem["infor"].to_i != info) && (info != 0))
					calcM = "%.0f" % ((viagem["horar"].to_time - horaMov)/60)
					info = viagem["infor"].to_i
					hrf = (viagem["datar"]+" "+viagem["horar"])
					horaFinal = hrf.to_time
					if(calcM.to_i > 0)
						ht = calcM.to_i.minutes
						tempoMov = tempoMov + ht
					end
					#Rails.logger.debug("Dados Hora #{viagem['horar'].to_time} - #{horaMov} - #{calcM}")
				end

				if((viagem["infor"].to_i == 1) && ((viagem["horar"].to_time < "05:00:00".to_time) || (viagem["horar"].to_time > "21:59:59".to_time)))
					dataNG = viagem['datar']+" "+viagem['horar']
					if(hora_noturnaI == "00:00:00".to_time)
						hora_noturnaI = dataNG.to_time
						#hora_noturnaU = dataNG.to_time
					end
					hora_noturnaU = dataNG.to_time
					hora_noturnaA = dataNG.to_time
					#Rails.logger.debug("Dados Adicional Noturno Inicio #{viagem['datar']} #{viagem['horar']} #{hora_noturnaU}")
				end

				if((viagem["infor"].to_i == 2) && (hora_noturnaA != "00:00:00".to_time))
					han = viagem['horar']
					if((han.to_time > "04:59:59".to_time) && (han.to_time < "22:00:00".to_time))
						han = "04:59:59"
					end
					dataNG = viagem['datar']+" "+han
					hora_noturnaA = dataNG.to_time
					hora_noturnaG = CalculoHoraNoturna(hora_noturnaG,hora_noturnaA,hora_noturnaU)
					hora_noturnaG2 = CalculoHoraNoturna(hora_noturnaG2,hora_noturnaA,hora_noturnaU)
					#Rails.logger.debug("Dados Adicional Noturno Fim #{viagem['datar']} #{viagem['horar']} | #{hora_noturnaU} | #{hora_noturnaG2}")
					hora_noturnaU = hora_noturnaA
					hora_noturnaA = "00:00:00".to_time
					
				end

				horaAt = viagem["horar"].to_time
			else
				if((dataI != "0000-00-00") && (horaInicial != "00:00:00".to_time))
					#horaFinal = horaAt.to_time
					calc = Time.at(horaFinal - horaInicial)+3.hour #horaInicial + 30.minutes
					hora_extra = "00:00:00".to_time
					

					if ("08:00:00".to_time.strftime("%H:%M:%S") <= tempoMov.strftime("%H:%M:%S"))
						hora_extra = (Time.at(tempoMov - "08:00:00".to_time)+3.hour)
						hora_extraG = CalculoHoraExtra(hora_extraG,tempoMov)
						
					else
						hora_extra = "00:00:00".to_time
					end

					if((intp % 2) == 0)
						estilo = linhap
						estiloe = linhape
						estilot = linhapt
						estiloet = linhapet
					else
						estilo = linhai
						estiloe = linhaie
						estilot = linhait
						estiloet = linhaiet
					end

					#sheet.add_row [dataI.to_date.strftime('%d/%m/%Y')+" - "+l(dataI.to_date, :format => :semana), horaInicial.strftime("%H:%M:%S"), horaFinal.strftime("%H:%M:%S"), calc.strftime("%H:%M:%S"), tempoMov.strftime("%H:%M:%S"), (Time.at(calc - tempoMov)+3.hour).strftime("%H:%M:%S"), hora_extra.strftime("%M:%M:%S"), hora_noturnaG.strftime("%H:%M:%S"), (hora_inter == "00:00:00".to_time ? '00:00:00' : CalculoHora(horaInicial,hora_inter))], style: [estiloe,estilot,estilot,estilot,estilot,estilot,estilot,estilot,estilot]
					arrDatas.push ((dataI.to_datetime + 3.hour))
					arrDados.push (dataI.to_date.strftime('%d/%m/%Y')+" - "+l(dataI.to_date,:format => :semana)+";"+horaInicial.strftime("%H:%M:%S")+";"+horaFinal.strftime("%H:%M:%S")+";"+calc.strftime("%H:%M:%S")+";"+tempoMov.strftime("%H:%M:%S")+";"+(Time.at(calc - tempoMov)+3.hour).strftime("%H:%M:%S")+";"+hora_extra.strftime("%H:%M:%S")+";"+hora_noturnaG.strftime("%H:%M:%S")+";"+ (hora_inter == "00:00:00".to_time ? '00:00:00' : CalculoHora(horaInicial,hora_inter)))		
			
			
					intp += 1		
					#dataI = "0000-00-00"
					hora_inter = horaFinal
					horaInicial = "00:00:00".to_time
					horaFinal = "00:00:00".to_time
					horaAt = "00:00:00".to_time
					horaMov = "00:00:00".to_time
					horaParada = "00:00:00".to_time
					calcM = "00:00:00".to_time
					tempoMov = "00:00:00".to_time
					hora_noturnaI = "00:00:00".to_time
					hora_noturnaA = "00:00:00".to_time
					hora_noturnaU = "00:00:00".to_time
					hora_noturnaG = "00:00:00".to_time
					#hora_extraG = "00:00:00".to_time
					info = 0
				end
				dataI = viagem["datar"]
				if(viagem["infor"].to_i == 1)
					#Rails.logger.debug("Gravou a Hora Inicial Primeiro #{viagem['datar']} #{viagem['horar']} #{viagem['infor']}")
					hri = (viagem["datar"]+" "+viagem["horar"])
					horaInicial = hri.to_time
					horaMov = viagem["horar"].to_time
				end
					#ret += viagem["datar"]+"<br>"
				
			end
		end

		if(horaInicial != "00:00:00".to_time)
			#horaFinal = horaAt.to_time
			calc = Time.at(horaFinal - horaInicial)+3.hour #horaInicial + 30.minutes
			hora_extra = "00:00:00".to_time

			if ("08:00:00".to_time.strftime("%H:%M:%S") <= tempoMov.strftime("%H:%M:%S"))
				hora_extra = (Time.at(tempoMov - "08:00:00".to_time)+3.hour)
				hora_extraG = CalculoHoraExtra(hora_extraG,tempoMov)
				else
				hora_extra = "00:00:00".to_time
			end

			if((intp % 2) == 0)
				estilo = linhap
				estiloe = linhape
				estilot = linhapt
				estiloet = linhapet
			else
				estilo = linhai
				estiloe = linhaie
				estilot = linhait
				estiloet = linhaiet
			end

			arrDatas.push ((dataI.to_datetime + 3.hour))
			arrDados.push (dataI.to_date.strftime('%d/%m/%Y')+" - "+l(dataI.to_date,:format => :semana)+";"+horaInicial.strftime("%H:%M:%S")+";"+horaFinal.strftime("%H:%M:%S")+";"+calc.strftime("%H:%M:%S")+";"+tempoMov.strftime("%H:%M:%S")+";"+(Time.at(calc - tempoMov)+3.hour).strftime("%H:%M:%S")+";"+hora_extra.strftime("%H:%M:%S")+";"+hora_noturnaG.strftime("%H:%M:%S")+";"+ (hora_inter == "00:00:00".to_time ? '00:00:00' : CalculoHora(horaInicial,hora_inter)))		
			
			#sheet.add_row [dataI.to_date.strftime('%d/%m/%Y')+" - "+l(dataI.to_date,:format => :semana), horaInicial.strftime("%H:%M:%S"), horaFinal.strftime("%H:%M:%S"), calc.strftime("%H:%M:%S"), tempoMov.strftime("%H:%M:%S"), (Time.at(calc - tempoMov)+3.hour).strftime("%H:%M:%S"), hora_extra, hora_noturnaG.strftime("%H:%M:%S"), (hora_inter == "00:00:00".to_time ? '00:00:00' : CalculoHora(horaInicial,hora_inter))], style: [estiloe,estilot,estilot,estilot,estilot,estilot,estilot,estilot,estilot]
					
			
		end

		#hora_X = ("%.2f" % ((hora_extraG - hora_extraI)/1.hour))
		intp = 1
		inic = 0
		inid = 0
		tempoViagem = "00:00:00".to_time
		tempoViagemI = "00:00:00".to_time
		tempoJornada = "00:00:00".to_time
		tempoJornadaI = "00:00:00".to_time
		tempoDescanso = "00:00:00".to_time
		tempoDescansoI = "00:00:00".to_time
		tempoInter = "00:00:00".to_time
		tempoInterI = "00:00:00".to_time
		tempoDescansoS = "00:00:00".to_time
		tempoDescansoSI = "00:00:00".to_time
		
		
		((@data_inicial.to_datetime + 3.hour).to_i..(@data_final.to_datetime + 3.hour).to_i).step(1.day) do |date|
			if((intp % 2) == 0)
				estilo = linhap
				estiloe = linhape
				estilot = linhapt
				estiloet = linhapet
			else
				estilo = linhai
				estiloe = linhaie
				estilot = linhait
				estiloet = linhaiet
			end

			dataTeste = Time.at(date)
			found = arrDatas.detect {|dataT| dataT == dataTeste}
			if found.present?
				 
				pega = arrDatas.index {|dataT| dataT == dataTeste}
				dadosPG = arrDados[pega].split(";")

				if inic == 0
					tempoViagem = dadosPG[3].to_time
					tempoJornada = dadosPG[4].to_time
					tempoDescanso = dadosPG[5].to_time
					tempoInter = dadosPG[8].to_time
					Rails.logger.debug("Dados te teste: #{tempoViagem}")
				end
				inic += 1
				tempoViagemI = CalculoHorarios(tempoViagemI,dadosPG[3].to_time)
				tempoJornadaI = CalculoHorarios(tempoJornadaI,dadosPG[4].to_time)
				tempoDescansoI = CalculoHorarios(tempoDescansoI,dadosPG[5].to_time)
				if dadosPG[8] != "00:00:00"
					Rails.logger.debug("Dados do Range: #{dadosPG[8]}")
					tempoInterI = CalculoHorarioPlus(tempoInterI,dadosPG[8])
				end

				sheet.add_row [dadosPG[0], dadosPG[1], dadosPG[2], dadosPG[3], dadosPG[4], dadosPG[5], dadosPG[6], dadosPG[7], dadosPG[8],'','' ], style: [estiloe,estilot,estilot,estilot,estilot,estilot,estilot,estilot,estilot,estilot,estilot]
				
			else

				if inid == 0
					tempoDescansoS = "00:00:00".to_time
				end
				tempoDescansoSI = CalculoHorarioPlus(tempoDescansoSI,"24:00:00")

				sheet.add_row [dataTeste.to_date.strftime('%d/%m/%Y')+" - "+l(dataTeste.to_date,:format => :semana), '00:00:00', '00:00:00', '00:00:00', '00:00:00', '00:00:00', '00:00:00', '00:00:00', '00:00:00','','24:00:00'], style: [estiloe,estilot,estilot,estilot,estilot,estilot,estilot,estilot,estilot,estilot,estilot]
				
			end
			intp += 1
		end

		sheet.add_row ['Total','','',CalculoH(tempoViagem,tempoViagemI),CalculoH(tempoJornada,tempoJornadaI),CalculoH(tempoDescanso,tempoDescansoI),CalculoHora(hora_extraI,hora_extraG),CalculoHora(hora_noturnaG1,hora_noturnaG2),CalculoH(tempoInter,tempoInterI),'',CalculoH(tempoDescansoS,tempoDescansoSI)], style: [rodape,rodape,rodape,rodape,rodape,rodape,rodape,rodape,rodape,rodape,rodape]
		#Rails.logger.debug("Dados te teste: #{tempoViagem} <-> #{tempoViagemI}")
		#ret += "</tbody></table>"

		return sheet

	end




	def CalculoHoraNoturna(horaE,totalH,totalA)
		hora_extra = (Time.at(totalH - totalA)+3.hour)
		#Rails.logger.debug("Calculo Adicional Noturno Inicio #{hora_extra} | #{horaE} | #{totalH} | #{totalA}")
		horaE = horaE + hora_extra.strftime("%H").to_i.hours
		horaE = horaE + hora_extra.strftime("%M").to_i.minutes
		#Rails.logger.debug("Calculo Adicional Noturno Fim #{horaE}")
		return horaE
	end

	def CalculoHorarios(horaT,horaI)
		horaT = horaT + horaI.strftime("%H").to_i.hours
		horaT = horaT + horaI.strftime("%M").to_i.minutes
		horaT = horaT + horaI.strftime("%S").to_i.seconds
		
		return horaT
	end

	def CalculoHorarioPlus(horaT,horaI)
		horaT = horaT + horaI[0..1].to_i.hours
		horaT = horaT + horaI[3..4].to_i.minutes
		horaT = horaT + horaI[6..7].to_i.seconds
		
		return horaT
	end

	def CalculoHoraExtra(horaE,totalH)
		hora_extra = (Time.at(totalH - "08:00:00".to_time)+3.hour)
		horaE = horaE + hora_extra.strftime("%H").to_i.hours
		horaE = horaE + hora_extra.strftime("%M").to_i.minutes
		return horaE
	end

	def CalculoH(primeiro,segundo)
		segundos = segundo.strftime("%S").to_i
		minuto = segundo.strftime("%M").to_i
		hora = segundo.strftime("%H").to_i
		diaS = segundo.strftime("%d").to_i
		diaP = primeiro.strftime("%d").to_i
		diasCalc = ((diaS - diaP) * 24)+hora
		Rails.logger.debug("Datas aqui tem dados #{diaS} - #{diaP} -> #{primeiro} - #{segundo}")
		return ("%02d" % diasCalc).to_s+":"+("%02d" % minuto).to_s+":"+("%02d" % segundos).to_s
	end

	def CalculoHora(primeiro,segundo)

		hora_X = ("%.2f" % ((segundo - primeiro)/1.hour)).to_s.split(".")
		#Rails.logger.debug("Calculo das horas: #{primeiro} #{segundo} #{hora_X[0]} #{hora_X[1]}")
		minuto_X_H = (hora_X[1].to_i * 60)/100
		#minuto_X_M = hora_X[1].to_i % 60
		if(hora_X[0].to_i < 0)
			hora_X[0] = hora_X[0].to_i * (-1)
		end

		return ("%02d" % hora_X[0]).to_s+":"+("%02d" % minuto_X_H)+":00".to_s

	end
end
