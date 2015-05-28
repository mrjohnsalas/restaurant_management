require 'test_helper'

class UserCardsControllerTest < ActionController::TestCase
  setup do
    @user_card = user_cards(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:user_cards)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create user_card" do
    assert_difference('UserCard.count') do
      post :create, user_card: { card_number: @user_card.card_number, credit_card_type_id: @user_card.credit_card_type_id, is_default: @user_card.is_default, user_id: @user_card.user_id }
    end

    assert_redirected_to user_card_path(assigns(:user_card))
  end

  test "should show user_card" do
    get :show, id: @user_card
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @user_card
    assert_response :success
  end

  test "should update user_card" do
    patch :update, id: @user_card, user_card: { card_number: @user_card.card_number, credit_card_type_id: @user_card.credit_card_type_id, is_default: @user_card.is_default, user_id: @user_card.user_id }
    assert_redirected_to user_card_path(assigns(:user_card))
  end

  test "should destroy user_card" do
    assert_difference('UserCard.count', -1) do
      delete :destroy, id: @user_card
    end

    assert_redirected_to user_cards_path
  end
end
