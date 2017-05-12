require 'test_helper'

class EmplsControllerTest < ActionController::TestCase
  setup do
    @empl = empls(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:empls)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create empl" do
    assert_difference('Empl.count') do
      post :create, empl: { birthday: @empl.birthday, depart_id: @empl.depart_id, first_name: @empl.first_name, inn: @empl.inn, last_name: @empl.last_name, passport: @empl.passport, post: @empl.post, second_name: @empl.second_name }
    end

    assert_redirected_to empl_path(assigns(:empl))
  end

  test "should show empl" do
    get :show, id: @empl
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @empl
    assert_response :success
  end

  test "should update empl" do
    patch :update, id: @empl, empl: { birthday: @empl.birthday, depart_id: @empl.depart_id, first_name: @empl.first_name, inn: @empl.inn, last_name: @empl.last_name, passport: @empl.passport, post: @empl.post, second_name: @empl.second_name }
    assert_redirected_to empl_path(assigns(:empl))
  end

  test "should destroy empl" do
    assert_difference('Empl.count', -1) do
      delete :destroy, id: @empl
    end

    assert_redirected_to empls_path
  end
end
