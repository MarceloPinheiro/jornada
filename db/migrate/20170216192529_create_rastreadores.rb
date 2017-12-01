class CreateRastreadores < ActiveRecord::Migration
  def change
    create_table :rastreadores do |t|
      t.string :marca
      t.string :modelo

      t.timestamps null: false
    end
  end
end
