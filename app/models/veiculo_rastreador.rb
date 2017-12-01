class VeiculoRastreador < ActiveRecord::Base
  belongs_to :veiculo
  belongs_to :rastreador
end
