json.array!(@empresas) do |empresa|
  json.extract! empresa, :id, :razao, :cnpj
  json.url empresa_url(empresa, format: :json)
end
