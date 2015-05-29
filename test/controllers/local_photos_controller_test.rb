require 'test_helper'

class LocalPhotosControllerTest < ActionController::TestCase
  setup do
    @local_photo = local_photos(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:local_photos)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create local_photo" do
    assert_difference('LocalPhoto.count') do
      post :create, local_photo: { index: @local_photo.index, local_id: @local_photo.local_id }
    end

    assert_redirected_to local_photo_path(assigns(:local_photo))
  end

  test "should show local_photo" do
    get :show, id: @local_photo
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @local_photo
    assert_response :success
  end

  test "should update local_photo" do
    patch :update, id: @local_photo, local_photo: { index: @local_photo.index, local_id: @local_photo.local_id }
    assert_redirected_to local_photo_path(assigns(:local_photo))
  end

  test "should destroy local_photo" do
    assert_difference('LocalPhoto.count', -1) do
      delete :destroy, id: @local_photo
    end

    assert_redirected_to local_photos_path
  end
end
