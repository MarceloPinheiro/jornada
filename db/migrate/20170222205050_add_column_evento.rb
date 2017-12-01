class AddColumnEvento < ActiveRecord::Migration
  def change
	add_column :eventos, :viagem_id, :integer
  end
end
