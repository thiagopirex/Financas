#teste heroku - á
class Gasto < ActiveRecord::Base

  validates_presence_of :descricao, :message => "deve ser preenchido"
  validates_presence_of :valor, :message => "deve ser preenchido"

  validate :primeira_letra_descricao_maiuscula
  
  private
  def primeira_letra_descricao_maiuscula
    errors.add("Descrição", "deve ter a primeira letra maiúscula") unless descricao =~/[A-Z].*/
  end
  
end
