class CreateEventos < ActiveRecord::Migration
  def change
    create_table :eventos do |t|
      t.references :veiculo, index: true, foreign_key: true
      t.references :motorista, index: true, foreign_key: true
      t.references :tipo_evento, index: true, foreign_key: true
      t.date :data_evento
      t.date :data_lancamento
      t.text :local
      t.integer :motor
      t.decimal :velocidade
      t.decimal :altitude
      t.decimal :latitude
      t.decimal :longitude

      t.timestamps null: false
    end
  end
end
