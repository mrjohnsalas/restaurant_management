require 'test_helper'

class LocalCardsControllerTest < ActionController::TestCase
  setup do
    @local_card = local_cards(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:local_cards)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create local_card" do
    assert_difference('LocalCard.count') do
      post :create, local_card: { credit_card_type_id: @local_card.credit_card_type_id, local_id: @local_card.local_id }
    end

    assert_redirected_to local_card_path(assigns(:local_card))
  end

  test "should show local_card" do
    get :show, id: @local_card
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @local_card
    assert_response :success
  end

  test "should update local_card" do
    patch :update, id: @local_card, local_card: { credit_card_type_id: @local_card.credit_card_type_id, local_id: @local_card.local_id }
    assert_redirected_to local_card_path(assigns(:local_card))
  end

  test "should destroy local_card" do
    assert_difference('LocalCard.count', -1) do
      delete :destroy, id: @local_card
    end

    assert_redirected_to local_cards_path
  end
end
