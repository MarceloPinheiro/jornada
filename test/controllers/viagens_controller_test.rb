require 'test_helper'

class ViagensControllerTest < ActionController::TestCase
  setup do
    @viagem = viagens(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:viagens)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create viagem" do
    assert_difference('Viagem.count') do
      post :create, viagem: { data_fim: @viagem.data_fim, data_inicio: @viagem.data_inicio, destino: @viagem.destino, origem: @viagem.origem, veiculo_id: @viagem.veiculo_id }
    end

    assert_redirected_to viagem_path(assigns(:viagem))
  end

  test "should show viagem" do
    get :show, id: @viagem
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @viagem
    assert_response :success
  end

  test "should update viagem" do
    patch :update, id: @viagem, viagem: { data_fim: @viagem.data_fim, data_inicio: @viagem.data_inicio, destino: @viagem.destino, origem: @viagem.origem, veiculo_id: @viagem.veiculo_id }
    assert_redirected_to viagem_path(assigns(:viagem))
  end

  test "should destroy viagem" do
    assert_difference('Viagem.count', -1) do
      delete :destroy, id: @viagem
    end

    assert_redirected_to viagens_path
  end
end
