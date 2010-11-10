require 'test_helper'

class GastoTest < ActiveSupport::TestCase

  test "should create gasto" do
    gasto = Gasto.create(:descricao => "Combustivel da viagem", 
                         :valor => "100",
                         :data => Time.new)
    assert gasto.valid? 
  end
  
  test "should require descricao" do
    gasto = Gasto.create(:descricao => nil, 
                         :valor => "100",
                         :data => Time.new)
    assert !gasto.valid?
  end
  
  test "should require valor" do
    gasto = Gasto.create(:descricao => "compra roupas", 
                         :valor => nil,
                         :data => Time.new)
    assert !gasto.valid?
  end
  
  test "should require valor and descricao" do
    gasto = Gasto.create(:descricao => nil, 
                         :valor => nil,
                         :data => Time.new)
    assert !gasto.valid?
  end
end
