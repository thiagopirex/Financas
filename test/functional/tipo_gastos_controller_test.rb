require 'test_helper'

class TipoGastosControllerTest < ActionController::TestCase
  setup do
    @tipo_gasto = tipo_gastos(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:tipo_gastos)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create tipo_gasto" do
    assert_difference('TipoGasto.count') do
      post :create, :tipo_gasto => @tipo_gasto.attributes
    end

    assert_redirected_to tipo_gasto_path(assigns(:tipo_gasto))
  end

  test "should show tipo_gasto" do
    get :show, :id => @tipo_gasto.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @tipo_gasto.to_param
    assert_response :success
  end

  test "should update tipo_gasto" do
    put :update, :id => @tipo_gasto.to_param, :tipo_gasto => @tipo_gasto.attributes
    assert_redirected_to tipo_gasto_path(assigns(:tipo_gasto))
  end

  test "should destroy tipo_gasto" do
    assert_difference('TipoGasto.count', -1) do
      delete :destroy, :id => @tipo_gasto.to_param
    end

    assert_redirected_to tipo_gastos_path
  end
end
