json.array!(@eventos) do |evento|
  json.extract! evento, :id, :veiculo_id, :motorista_id, :tipo_evento_id, :data_evento, :data_lancamento, :local, :motor, :velocidade, :altitude, :latitude, :longitude
  json.url evento_url(evento, format: :json)
end
