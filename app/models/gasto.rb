#teste heroku - á
class Gasto < ActiveRecord::Base

  belongs_to :usuario

  validates_presence_of :descricao, :message => "deve ser preenchido"
  validates_presence_of :valor, :message => "deve ser preenchido"
  
  scope :find_by_user, lambda { |user| { :conditions => ["user_id = ?", user.id] }}
  
end
