json.array!(@motoristas) do |motorista|
  json.extract! motorista, :id, :nome, :cnh, :telefone, :email, :cpf, :empresa_id
  json.url motorista_url(motorista, format: :json)
end
