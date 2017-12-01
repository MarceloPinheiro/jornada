json.array!(@tipo_paradas) do |tipo_parada|
  json.extract! tipo_parada, :id, :descricao
  json.url tipo_parada_url(tipo_parada, format: :json)
end
