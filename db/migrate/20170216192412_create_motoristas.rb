class CreateMotoristas < ActiveRecord::Migration
  def change
    create_table :motoristas do |t|
      t.string :nome
      t.string :cnh
      t.string :telefone
      t.string :email
      t.string :cpf
      t.references :empresa, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
