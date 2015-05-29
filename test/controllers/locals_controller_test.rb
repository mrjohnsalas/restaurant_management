require 'test_helper'

class LocalsControllerTest < ActionController::TestCase
  setup do
    @local = locals(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:locals)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create local" do
    assert_difference('Local.count') do
      post :create, local: { allow_credit_card: @local.allow_credit_card, allow_delivery: @local.allow_delivery, allow_parking: @local.allow_parking, allow_reservation: @local.allow_reservation, description: @local.description, district_id: @local.district_id, email_1: @local.email_1, email_2: @local.email_2, name: @local.name, phone_1: @local.phone_1, phone_2: @local.phone_2, restaurant_id: @local.restaurant_id }
    end

    assert_redirected_to local_path(assigns(:local))
  end

  test "should show local" do
    get :show, id: @local
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @local
    assert_response :success
  end

  test "should update local" do
    patch :update, id: @local, local: { allow_credit_card: @local.allow_credit_card, allow_delivery: @local.allow_delivery, allow_parking: @local.allow_parking, allow_reservation: @local.allow_reservation, description: @local.description, district_id: @local.district_id, email_1: @local.email_1, email_2: @local.email_2, name: @local.name, phone_1: @local.phone_1, phone_2: @local.phone_2, restaurant_id: @local.restaurant_id }
    assert_redirected_to local_path(assigns(:local))
  end

  test "should destroy local" do
    assert_difference('Local.count', -1) do
      delete :destroy, id: @local
    end

    assert_redirected_to locals_path
  end
end
