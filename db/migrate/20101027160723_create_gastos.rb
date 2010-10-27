class CreateGastos < ActiveRecord::Migration
  def self.up
    create_table :gastos do |t|
      t.string :descricao
      t.string :valor

      t.timestamps
    end
  end

  def self.down
    drop_table :gastos
  end
end
