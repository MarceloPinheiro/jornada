class AddColumnMotorista < ActiveRecord::Migration
  def change
	add_column :motoristas, :status, :integer
  end
end
