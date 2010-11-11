require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test "should include user" do
    usuario = User.create(:login => 'teste_include', :email => 'teste@teste.com', :password => 'password', :password_confirmation => 'password')
    assert usuario.valid?, "Usuario nao foi incuido corretamente"
    usuario2 = User.find(:last)
    assert usuario.eql? usuario2
  end
end
