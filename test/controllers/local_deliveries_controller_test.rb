require 'test_helper'

class LocalDeliveriesControllerTest < ActionController::TestCase
  setup do
    @local_delivery = local_deliveries(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:local_deliveries)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create local_delivery" do
    assert_difference('LocalDelivery.count') do
      post :create, local_delivery: { district_id: @local_delivery.district_id, end_time: @local_delivery.end_time, local_id: @local_delivery.local_id, start_time: @local_delivery.start_time }
    end

    assert_redirected_to local_delivery_path(assigns(:local_delivery))
  end

  test "should show local_delivery" do
    get :show, id: @local_delivery
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @local_delivery
    assert_response :success
  end

  test "should update local_delivery" do
    patch :update, id: @local_delivery, local_delivery: { district_id: @local_delivery.district_id, end_time: @local_delivery.end_time, local_id: @local_delivery.local_id, start_time: @local_delivery.start_time }
    assert_redirected_to local_delivery_path(assigns(:local_delivery))
  end

  test "should destroy local_delivery" do
    assert_difference('LocalDelivery.count', -1) do
      delete :destroy, id: @local_delivery
    end

    assert_redirected_to local_deliveries_path
  end
end
