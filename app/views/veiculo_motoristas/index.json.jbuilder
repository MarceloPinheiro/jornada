json.array!(@veiculo_motoristas) do |veiculo_motorista|
  json.extract! veiculo_motorista, :id, :veiculo_id, :motorista_id, :status
  json.url veiculo_motorista_url(veiculo_motorista, format: :json)
end
