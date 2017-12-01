class CreateVeiculos < ActiveRecord::Migration
  def change
    create_table :veiculos do |t|
      t.references :empresa, index: true, foreign_key: true
      t.references :motorista, index: true, foreign_key: true
      t.string :placa
      t.references :rastreador, index: true, foreign_key: true
      t.string :cor

      t.timestamps null: false
    end
  end
end
