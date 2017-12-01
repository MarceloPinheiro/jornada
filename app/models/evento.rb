class Evento < ActiveRecord::Base
  belongs_to :veiculo
  belongs_to :motorista
  belongs_to :tipo_evento
end
