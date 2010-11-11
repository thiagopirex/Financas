#teste encoding - á

class CreateGastos < ActiveRecord::Migration
  def self.up
    create_table :gastos do |t|
      t.string :descricao
      t.float :valor
      t.date :data
      t.timestamps
    end
  end

  def self.down
    drop_table :gastos
  end
end
