require 'test_helper'

class RastreadoresControllerTest < ActionController::TestCase
  setup do
    @rastreador = rastreadores(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:rastreadores)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create rastreador" do
    assert_difference('Rastreador.count') do
      post :create, rastreador: { marca: @rastreador.marca, modelo: @rastreador.modelo }
    end

    assert_redirected_to rastreador_path(assigns(:rastreador))
  end

  test "should show rastreador" do
    get :show, id: @rastreador
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @rastreador
    assert_response :success
  end

  test "should update rastreador" do
    patch :update, id: @rastreador, rastreador: { marca: @rastreador.marca, modelo: @rastreador.modelo }
    assert_redirected_to rastreador_path(assigns(:rastreador))
  end

  test "should destroy rastreador" do
    assert_difference('Rastreador.count', -1) do
      delete :destroy, id: @rastreador
    end

    assert_redirected_to rastreadores_path
  end
end
