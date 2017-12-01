class CreateTipoParadas < ActiveRecord::Migration
  def change
    create_table :tipo_paradas do |t|
      t.string :descricao

      t.timestamps null: false
    end
  end
end
