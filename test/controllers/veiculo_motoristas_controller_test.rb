require 'test_helper'

class VeiculoMotoristasControllerTest < ActionController::TestCase
  setup do
    @veiculo_motorista = veiculo_motoristas(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:veiculo_motoristas)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create veiculo_motorista" do
    assert_difference('VeiculoMotorista.count') do
      post :create, veiculo_motorista: { motorista_id: @veiculo_motorista.motorista_id, status: @veiculo_motorista.status, veiculo_id: @veiculo_motorista.veiculo_id }
    end

    assert_redirected_to veiculo_motorista_path(assigns(:veiculo_motorista))
  end

  test "should show veiculo_motorista" do
    get :show, id: @veiculo_motorista
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @veiculo_motorista
    assert_response :success
  end

  test "should update veiculo_motorista" do
    patch :update, id: @veiculo_motorista, veiculo_motorista: { motorista_id: @veiculo_motorista.motorista_id, status: @veiculo_motorista.status, veiculo_id: @veiculo_motorista.veiculo_id }
    assert_redirected_to veiculo_motorista_path(assigns(:veiculo_motorista))
  end

  test "should destroy veiculo_motorista" do
    assert_difference('VeiculoMotorista.count', -1) do
      delete :destroy, id: @veiculo_motorista
    end

    assert_redirected_to veiculo_motoristas_path
  end
end
