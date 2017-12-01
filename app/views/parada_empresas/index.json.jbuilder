json.array!(@parada_empresas) do |parada_empresa|
  json.extract! parada_empresa, :id, :ponto_parada_id, :empresa_id
  json.url parada_empresa_url(parada_empresa, format: :json)
end
