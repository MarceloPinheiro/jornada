class Addcolumnveiculo < ActiveRecord::Migration
  def change
	add_column :veiculos, :status, :integer
  end
end
