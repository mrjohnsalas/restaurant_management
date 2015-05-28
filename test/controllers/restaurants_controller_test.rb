require 'test_helper'

class RestaurantsControllerTest < ActionController::TestCase
  setup do
    @restaurant = restaurants(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:restaurants)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create restaurant" do
    assert_difference('Restaurant.count') do
      post :create, restaurant: { allow_point: @restaurant.allow_point, email_1: @restaurant.email_1, email_2: @restaurant.email_2, facebook: @restaurant.facebook, instagram: @restaurant.instagram, min_points: @restaurant.min_points, name: @restaurant.name, object_type_id: @restaurant.object_type_id, phone_1: @restaurant.phone_1, phone_2: @restaurant.phone_2, twitter: @restaurant.twitter, user_id: @restaurant.user_id, web_page: @restaurant.web_page }
    end

    assert_redirected_to restaurant_path(assigns(:restaurant))
  end

  test "should show restaurant" do
    get :show, id: @restaurant
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @restaurant
    assert_response :success
  end

  test "should update restaurant" do
    patch :update, id: @restaurant, restaurant: { allow_point: @restaurant.allow_point, email_1: @restaurant.email_1, email_2: @restaurant.email_2, facebook: @restaurant.facebook, instagram: @restaurant.instagram, min_points: @restaurant.min_points, name: @restaurant.name, object_type_id: @restaurant.object_type_id, phone_1: @restaurant.phone_1, phone_2: @restaurant.phone_2, twitter: @restaurant.twitter, user_id: @restaurant.user_id, web_page: @restaurant.web_page }
    assert_redirected_to restaurant_path(assigns(:restaurant))
  end

  test "should destroy restaurant" do
    assert_difference('Restaurant.count', -1) do
      delete :destroy, id: @restaurant
    end

    assert_redirected_to restaurants_path
  end
end
