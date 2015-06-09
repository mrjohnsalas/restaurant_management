require 'test_helper'

class OrderCardsControllerTest < ActionController::TestCase
  setup do
    @order_card = order_cards(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:order_cards)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create order_card" do
    assert_difference('OrderCard.count') do
      post :create, order_card: { order_id: @order_card.order_id, user_card_id: @order_card.user_card_id }
    end

    assert_redirected_to order_card_path(assigns(:order_card))
  end

  test "should show order_card" do
    get :show, id: @order_card
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @order_card
    assert_response :success
  end

  test "should update order_card" do
    patch :update, id: @order_card, order_card: { order_id: @order_card.order_id, user_card_id: @order_card.user_card_id }
    assert_redirected_to order_card_path(assigns(:order_card))
  end

  test "should destroy order_card" do
    assert_difference('OrderCard.count', -1) do
      delete :destroy, id: @order_card
    end

    assert_redirected_to order_cards_path
  end
end
