require 'test_helper'

class CastsControllerTest < ActionController::TestCase
  setup do
    @cast = casts(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:casts)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create cast" do
    assert_difference('Cast.count') do
      post :create, :cast => @cast.attributes
    end

    assert_redirected_to cast_path(assigns(:cast))
  end

  test "should show cast" do
    get :show, :id => @cast.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @cast.to_param
    assert_response :success
  end

  test "should update cast" do
    put :update, :id => @cast.to_param, :cast => @cast.attributes
    assert_redirected_to cast_path(assigns(:cast))
  end

  test "should destroy cast" do
    assert_difference('Cast.count', -1) do
      delete :destroy, :id => @cast.to_param
    end

    assert_redirected_to casts_path
  end
end
