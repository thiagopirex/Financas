require 'test_helper'

class GanhosControllerTest < ActionController::TestCase
  setup do
    @ganho = ganhos(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:ganhos)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create ganho" do
    assert_difference('Ganho.count') do
      post :create, :ganho => @ganho.attributes
    end

    assert_redirected_to ganho_path(assigns(:ganho))
  end

  test "should show ganho" do
    get :show, :id => @ganho.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @ganho.to_param
    assert_response :success
  end

  test "should update ganho" do
    put :update, :id => @ganho.to_param, :ganho => @ganho.attributes
    assert_redirected_to ganho_path(assigns(:ganho))
  end

  test "should destroy ganho" do
    assert_difference('Ganho.count', -1) do
      delete :destroy, :id => @ganho.to_param
    end

    assert_redirected_to ganhos_path
  end
end
