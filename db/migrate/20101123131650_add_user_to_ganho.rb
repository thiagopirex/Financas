class AddUserToGanho < ActiveRecord::Migration
  def self.up
    #Remove all gastos
     execute "DELETE FROM ganhos"
     add_column :ganhos, :user_id, :int, :null => false
     
     #add a foreign key
     execute <<-SQL     
       ALTER TABLE ganhos
         ADD CONSTRAINT fk_user
         FOREIGN KEY(user_id)
         REFERENCES users(id)
     SQL
  end

  def self.down
    execute "ALTER TABLE ganhos DROP CONSTRAINT fk_user"
    remove_column :ganhos, :user_id
  end
end
