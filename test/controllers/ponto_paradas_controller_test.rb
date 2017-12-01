require 'test_helper'

class PontoParadasControllerTest < ActionController::TestCase
  setup do
    @ponto_parada = ponto_paradas(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:ponto_paradas)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create ponto_parada" do
    assert_difference('PontoParada.count') do
      post :create, ponto_parada: { descricao: @ponto_parada.descricao, latitude: @ponto_parada.latitude, longitude: @ponto_parada.longitude, raio: @ponto_parada.raio, tipo_parada_id: @ponto_parada.tipo_parada_id }
    end

    assert_redirected_to ponto_parada_path(assigns(:ponto_parada))
  end

  test "should show ponto_parada" do
    get :show, id: @ponto_parada
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @ponto_parada
    assert_response :success
  end

  test "should update ponto_parada" do
    patch :update, id: @ponto_parada, ponto_parada: { descricao: @ponto_parada.descricao, latitude: @ponto_parada.latitude, longitude: @ponto_parada.longitude, raio: @ponto_parada.raio, tipo_parada_id: @ponto_parada.tipo_parada_id }
    assert_redirected_to ponto_parada_path(assigns(:ponto_parada))
  end

  test "should destroy ponto_parada" do
    assert_difference('PontoParada.count', -1) do
      delete :destroy, id: @ponto_parada
    end

    assert_redirected_to ponto_paradas_path
  end
end
