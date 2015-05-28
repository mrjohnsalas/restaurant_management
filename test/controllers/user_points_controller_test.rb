require 'test_helper'

class UserPointsControllerTest < ActionController::TestCase
  setup do
    @user_point = user_points(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:user_points)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create user_point" do
    assert_difference('UserPoint.count') do
      post :create, user_point: { quantity: @user_point.quantity, restaurant_id: @user_point.restaurant_id, user_id: @user_point.user_id }
    end

    assert_redirected_to user_point_path(assigns(:user_point))
  end

  test "should show user_point" do
    get :show, id: @user_point
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @user_point
    assert_response :success
  end

  test "should update user_point" do
    patch :update, id: @user_point, user_point: { quantity: @user_point.quantity, restaurant_id: @user_point.restaurant_id, user_id: @user_point.user_id }
    assert_redirected_to user_point_path(assigns(:user_point))
  end

  test "should destroy user_point" do
    assert_difference('UserPoint.count', -1) do
      delete :destroy, id: @user_point
    end

    assert_redirected_to user_points_path
  end
end
