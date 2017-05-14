require 'test_helper'

class EmplprojsControllerTest < ActionController::TestCase
  setup do
    @emplproj = emplprojs(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:emplprojs)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create emplproj" do
    assert_difference('Emplproj.count') do
      post :create, emplproj: { empl_id: @emplproj.empl_id, project_id: @emplproj.project_id }
    end

    assert_redirected_to emplproj_path(assigns(:emplproj))
  end

  test "should show emplproj" do
    get :show, id: @emplproj
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @emplproj
    assert_response :success
  end

  test "should update emplproj" do
    patch :update, id: @emplproj, emplproj: { empl_id: @emplproj.empl_id, project_id: @emplproj.project_id }
    assert_redirected_to emplproj_path(assigns(:emplproj))
  end

  test "should destroy emplproj" do
    assert_difference('Emplproj.count', -1) do
      delete :destroy, id: @emplproj
    end

    assert_redirected_to emplprojs_path
  end
end
