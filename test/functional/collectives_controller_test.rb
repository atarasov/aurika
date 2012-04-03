require 'test_helper'

class CollectivesControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:collectives)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create collective" do
    assert_difference('Collective.count') do
      post :create, :collective => { }
    end

    assert_redirected_to collective_path(assigns(:collective))
  end

  test "should show collective" do
    get :show, :id => collectives(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => collectives(:one).to_param
    assert_response :success
  end

  test "should update collective" do
    put :update, :id => collectives(:one).to_param, :collective => { }
    assert_redirected_to collective_path(assigns(:collective))
  end

  test "should destroy collective" do
    assert_difference('Collective.count', -1) do
      delete :destroy, :id => collectives(:one).to_param
    end

    assert_redirected_to collectives_path
  end
end
