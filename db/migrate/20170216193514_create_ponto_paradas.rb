class CreatePontoParadas < ActiveRecord::Migration
  def change
    create_table :ponto_paradas do |t|
      t.string :descricao
      t.references :tipo_parada, index: true, foreign_key: true
      t.decimal :latitude
      t.decimal :longitude
      t.decimal :raio

      t.timestamps null: false
    end
  end
end
