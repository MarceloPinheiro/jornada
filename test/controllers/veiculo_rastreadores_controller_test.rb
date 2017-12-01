require 'test_helper'

class VeiculoRastreadoresControllerTest < ActionController::TestCase
  setup do
    @veiculo_rastreador = veiculo_rastreadores(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:veiculo_rastreadores)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create veiculo_rastreador" do
    assert_difference('VeiculoRastreador.count') do
      post :create, veiculo_rastreador: { rastreador_id: @veiculo_rastreador.rastreador_id, status: @veiculo_rastreador.status, veiculo_id: @veiculo_rastreador.veiculo_id }
    end

    assert_redirected_to veiculo_rastreador_path(assigns(:veiculo_rastreador))
  end

  test "should show veiculo_rastreador" do
    get :show, id: @veiculo_rastreador
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @veiculo_rastreador
    assert_response :success
  end

  test "should update veiculo_rastreador" do
    patch :update, id: @veiculo_rastreador, veiculo_rastreador: { rastreador_id: @veiculo_rastreador.rastreador_id, status: @veiculo_rastreador.status, veiculo_id: @veiculo_rastreador.veiculo_id }
    assert_redirected_to veiculo_rastreador_path(assigns(:veiculo_rastreador))
  end

  test "should destroy veiculo_rastreador" do
    assert_difference('VeiculoRastreador.count', -1) do
      delete :destroy, id: @veiculo_rastreador
    end

    assert_redirected_to veiculo_rastreadores_path
  end
end
