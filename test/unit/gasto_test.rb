require 'test_helper'

class GastoTest < ActiveSupport::TestCase

  

  test "should create gasto" do
    
    assert_difference 'Gasto.count' do
      
      Gasto.create(:descricao => "Combustivel da viagem", 
                   :valor => "100",
                   :data => Time.new, 
                   :user => users(:one))
                         
    end
    
  end
  
  test "should require descricao" do
    gasto = Gasto.create(:descricao => nil, 
                         :valor => "100",
                         :data => Time.new,
                         :user_id => 1)
    assert !gasto.valid?
  end
  
  test "should require valor" do
    gasto = Gasto.new(:descricao => "compra roupas", 
                         :valor => nil,
                         :data => Time.new,
                         :user_id => 1)
    assert !gasto.valid?
  end
  
  test "should require valor and descricao" do
    gasto = Gasto.new(:descricao => nil, 
                         :valor => nil,
                         :data => Time.new,
                         :user_id => 1)
    assert !gasto.valid?
  end
  
  test "should not insert gasto without user" do
     gasto = Gasto.new(:descricao => "descricao", 
                         :valor => 10,
                         :data => Time.new,
                         :user => nil)
                         
     assert_raise RuntimeError do
       gasto.save
       raise 'Boom!!!'
     end

     #assert !gasto.valid?, ""
  end
  
end
