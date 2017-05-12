require 'test_helper'

class DepartsControllerTest < ActionController::TestCase
  setup do
    @depart = departs(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:departs)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create depart" do
    assert_difference('Depart.count') do
      post :create, depart: { d_name: @depart.d_name }
    end

    assert_redirected_to depart_path(assigns(:depart))
  end

  test "should show depart" do
    get :show, id: @depart
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @depart
    assert_response :success
  end

  test "should update depart" do
    patch :update, id: @depart, depart: { d_name: @depart.d_name }
    assert_redirected_to depart_path(assigns(:depart))
  end

  test "should destroy depart" do
    assert_difference('Depart.count', -1) do
      delete :destroy, id: @depart
    end

    assert_redirected_to departs_path
  end
end
