require 'test_helper'

class ParadaEmpresasControllerTest < ActionController::TestCase
  setup do
    @parada_empresa = parada_empresas(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:parada_empresas)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create parada_empresa" do
    assert_difference('ParadaEmpresa.count') do
      post :create, parada_empresa: { empresa_id: @parada_empresa.empresa_id, ponto_parada_id: @parada_empresa.ponto_parada_id }
    end

    assert_redirected_to parada_empresa_path(assigns(:parada_empresa))
  end

  test "should show parada_empresa" do
    get :show, id: @parada_empresa
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @parada_empresa
    assert_response :success
  end

  test "should update parada_empresa" do
    patch :update, id: @parada_empresa, parada_empresa: { empresa_id: @parada_empresa.empresa_id, ponto_parada_id: @parada_empresa.ponto_parada_id }
    assert_redirected_to parada_empresa_path(assigns(:parada_empresa))
  end

  test "should destroy parada_empresa" do
    assert_difference('ParadaEmpresa.count', -1) do
      delete :destroy, id: @parada_empresa
    end

    assert_redirected_to parada_empresas_path
  end
end
