class CreateVeiculoMotoristas < ActiveRecord::Migration
  def change
    create_table :veiculo_motoristas do |t|
      t.references :veiculo, index: true, foreign_key: true
      t.references :motorista, index: true, foreign_key: true
      t.integer :status

      t.timestamps null: false
    end
  end
end
