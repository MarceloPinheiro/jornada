class CreateViagens < ActiveRecord::Migration
  def change
    create_table :viagens do |t|
      t.references :veiculo, index: true, foreign_key: true
      t.integer :origem
      t.integer :destino
      t.date :data_inicio
      t.date :data_fim

      t.timestamps null: false
    end
  end
end
