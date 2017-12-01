json.array!(@veiculos) do |veiculo|
  json.extract! veiculo, :id, :empresa_id, :motorista_id, :placa, :rastreador_id, :cor
  json.url veiculo_url(veiculo, format: :json)
end
