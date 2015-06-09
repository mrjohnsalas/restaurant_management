require 'test_helper'

class OrderDeliveriesControllerTest < ActionController::TestCase
  setup do
    @order_delivery = order_deliveries(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:order_deliveries)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create order_delivery" do
    assert_difference('OrderDelivery.count') do
      post :create, order_delivery: { order_id: @order_delivery.order_id, user_address_id: @order_delivery.user_address_id }
    end

    assert_redirected_to order_delivery_path(assigns(:order_delivery))
  end

  test "should show order_delivery" do
    get :show, id: @order_delivery
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @order_delivery
    assert_response :success
  end

  test "should update order_delivery" do
    patch :update, id: @order_delivery, order_delivery: { order_id: @order_delivery.order_id, user_address_id: @order_delivery.user_address_id }
    assert_redirected_to order_delivery_path(assigns(:order_delivery))
  end

  test "should destroy order_delivery" do
    assert_difference('OrderDelivery.count', -1) do
      delete :destroy, id: @order_delivery
    end

    assert_redirected_to order_deliveries_path
  end
end
