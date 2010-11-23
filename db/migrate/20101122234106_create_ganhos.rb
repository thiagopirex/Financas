class CreateGanhos < ActiveRecord::Migration
  def self.up
    create_table :ganhos do |t|
      t.string :descricao
      t.float :valor
      t.date :data

      t.timestamps
    end
  end

  def self.down
    drop_table :ganhos
  end
end
