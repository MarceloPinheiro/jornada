class CreateParadaEmpresas < ActiveRecord::Migration
  def change
    create_table :parada_empresas do |t|
      t.references :ponto_parada, index: true, foreign_key: true
      t.references :empresa, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
