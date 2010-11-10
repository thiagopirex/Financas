#teste heroku - á
class Gasto < ActiveRecord::Base

  validates_presence_of :descricao, :message => "deve ser preenchido"
  validates_presence_of :valor, :message => "deve ser preenchido"
  
end
