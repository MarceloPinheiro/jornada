json.array!(@viagens) do |viagem|
  json.extract! viagem, :id, :veiculo_id, :origem, :destino, :data_inicio, :data_fim
  json.url viagem_url(viagem, format: :json)
end
