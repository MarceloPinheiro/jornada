class Veiculo < ActiveRecord::Base
  belongs_to :empresa
  belongs_to :motorista
  belongs_to :rastreador
end
