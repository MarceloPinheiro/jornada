require 'test_helper'

class MotoristasControllerTest < ActionController::TestCase
  setup do
    @motorista = motoristas(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:motoristas)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create motorista" do
    assert_difference('Motorista.count') do
      post :create, motorista: { cnh: @motorista.cnh, cpf: @motorista.cpf, email: @motorista.email, empresa_id: @motorista.empresa_id, nome: @motorista.nome, telefone: @motorista.telefone }
    end

    assert_redirected_to motorista_path(assigns(:motorista))
  end

  test "should show motorista" do
    get :show, id: @motorista
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @motorista
    assert_response :success
  end

  test "should update motorista" do
    patch :update, id: @motorista, motorista: { cnh: @motorista.cnh, cpf: @motorista.cpf, email: @motorista.email, empresa_id: @motorista.empresa_id, nome: @motorista.nome, telefone: @motorista.telefone }
    assert_redirected_to motorista_path(assigns(:motorista))
  end

  test "should destroy motorista" do
    assert_difference('Motorista.count', -1) do
      delete :destroy, id: @motorista
    end

    assert_redirected_to motoristas_path
  end
end
