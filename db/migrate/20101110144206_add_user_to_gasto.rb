#teste encoding - á
class AddUserToGasto < ActiveRecord::Migration
  def self.up
     #Remove all gastos
     execute "DELETE FROM gastos"
     add_column :gastos, :user_id, :int, :null => false
     
     #add a foreign key
     execute <<-SQL     
       ALTER TABLE gastos
         ADD CONSTRAINT fk_user
         FOREIGN KEY(user_id)
         REFERENCES users(id)
     SQL
  end

  def self.down
    execute "ALTER TABLE gastos DROP CONSTRAINT fk_user"
    remove_column :gastos, :user_id
  end
end
