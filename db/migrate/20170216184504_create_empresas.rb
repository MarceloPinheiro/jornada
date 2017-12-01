class CreateEmpresas < ActiveRecord::Migration
  def change
    create_table :empresas do |t|
      t.string :razao
      t.string :cnpj

      t.timestamps null: false
    end
  end
end
