class ParadaEmpresa < ActiveRecord::Base
  belongs_to :ponto_parada
  belongs_to :empresa
end
