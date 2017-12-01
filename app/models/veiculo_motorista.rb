class VeiculoMotorista < ActiveRecord::Base
  belongs_to :veiculo
  belongs_to :motorista
end
