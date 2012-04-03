require 'test_helper'

class FotoAlbumsControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:foto_albums)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create foto_album" do
    assert_difference('FotoAlbum.count') do
      post :create, :foto_album => { }
    end

    assert_redirected_to foto_album_path(assigns(:foto_album))
  end

  test "should show foto_album" do
    get :show, :id => foto_albums(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => foto_albums(:one).to_param
    assert_response :success
  end

  test "should update foto_album" do
    put :update, :id => foto_albums(:one).to_param, :foto_album => { }
    assert_redirected_to foto_album_path(assigns(:foto_album))
  end

  test "should destroy foto_album" do
    assert_difference('FotoAlbum.count', -1) do
      delete :destroy, :id => foto_albums(:one).to_param
    end

    assert_redirected_to foto_albums_path
  end
end
