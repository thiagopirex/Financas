class TipoGasto < ActiveRecord::Base
   belongs_to :user

  validates_presence_of :descricao, :message => "deve ser preenchido"
  
  scope :find_by_user, lambda { |user| { :conditions => ["user_id = ?", user.id] }}
end
