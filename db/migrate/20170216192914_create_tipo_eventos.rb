class CreateTipoEventos < ActiveRecord::Migration
  def change
    create_table :tipo_eventos do |t|
      t.string :descricao
      t.integer :acao

      t.timestamps null: false
    end
  end
end
