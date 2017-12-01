class CreateVeiculoRastreadores < ActiveRecord::Migration
  def change
    create_table :veiculo_rastreadores do |t|
      t.references :veiculo, index: true, foreign_key: true
      t.references :rastreador, index: true, foreign_key: true
      t.integer :status

      t.timestamps null: false
    end
  end
end
