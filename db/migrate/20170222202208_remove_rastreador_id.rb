class RemoveRastreadorId < ActiveRecord::Migration
  def change
	remove_column :veiculos, :rastreador_id
  end
end
