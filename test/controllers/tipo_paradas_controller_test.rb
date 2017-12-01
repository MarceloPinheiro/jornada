require 'test_helper'

class TipoParadasControllerTest < ActionController::TestCase
  setup do
    @tipo_parada = tipo_paradas(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:tipo_paradas)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create tipo_parada" do
    assert_difference('TipoParada.count') do
      post :create, tipo_parada: { descricao: @tipo_parada.descricao }
    end

    assert_redirected_to tipo_parada_path(assigns(:tipo_parada))
  end

  test "should show tipo_parada" do
    get :show, id: @tipo_parada
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @tipo_parada
    assert_response :success
  end

  test "should update tipo_parada" do
    patch :update, id: @tipo_parada, tipo_parada: { descricao: @tipo_parada.descricao }
    assert_redirected_to tipo_parada_path(assigns(:tipo_parada))
  end

  test "should destroy tipo_parada" do
    assert_difference('TipoParada.count', -1) do
      delete :destroy, id: @tipo_parada
    end

    assert_redirected_to tipo_paradas_path
  end
end
