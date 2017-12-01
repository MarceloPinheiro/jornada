json.array!(@veiculo_rastreadores) do |veiculo_rastreador|
  json.extract! veiculo_rastreador, :id, :veiculo_id, :rastreador_id, :status
  json.url veiculo_rastreador_url(veiculo_rastreador, format: :json)
end
