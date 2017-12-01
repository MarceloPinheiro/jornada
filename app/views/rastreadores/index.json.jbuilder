json.array!(@rastreadores) do |rastreador|
  json.extract! rastreador, :id, :marca, :modelo
  json.url rastreador_url(rastreador, format: :json)
end
