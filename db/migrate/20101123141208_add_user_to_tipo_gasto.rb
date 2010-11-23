class AddUserToTipoGasto < ActiveRecord::Migration
  def self.up
    #Remove all gastos
     execute "DELETE FROM tipo_gastos"
     add_column :tipo_gastos, :user_id, :int, :null => false
     
     #add a foreign key
     execute <<-SQL     
       ALTER TABLE tipo_gastos
         ADD CONSTRAINT fk_user
         FOREIGN KEY(user_id)
         REFERENCES users(id)
     SQL
  end

  def self.down
    execute "ALTER TABLE tipo_gastos DROP CONSTRAINT fk_user"
    remove_column :tipo_gastos, :user_id
  end
end
