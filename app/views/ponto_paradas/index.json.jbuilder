json.array!(@ponto_paradas) do |ponto_parada|
  json.extract! ponto_parada, :id, :descricao, :tipo_parada_id, :latitude, :longitude, :raio
  json.url ponto_parada_url(ponto_parada, format: :json)
end
