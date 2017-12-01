class RemoveMotoristaId < ActiveRecord::Migration
  def change
		  remove_column :veiculos, :motorista_id
  end
end
