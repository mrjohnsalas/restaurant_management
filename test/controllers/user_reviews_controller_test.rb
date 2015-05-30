require 'test_helper'

class UserReviewsControllerTest < ActionController::TestCase
  setup do
    @user_review = user_reviews(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:user_reviews)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create user_review" do
    assert_difference('UserReview.count') do
      post :create, user_review: { comment: @user_review.comment, object_id: @user_review.object_id, object_type_id: @user_review.object_type_id, rating: @user_review.rating, user_id: @user_review.user_id }
    end

    assert_redirected_to user_review_path(assigns(:user_review))
  end

  test "should show user_review" do
    get :show, id: @user_review
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @user_review
    assert_response :success
  end

  test "should update user_review" do
    patch :update, id: @user_review, user_review: { comment: @user_review.comment, object_id: @user_review.object_id, object_type_id: @user_review.object_type_id, rating: @user_review.rating, user_id: @user_review.user_id }
    assert_redirected_to user_review_path(assigns(:user_review))
  end

  test "should destroy user_review" do
    assert_difference('UserReview.count', -1) do
      delete :destroy, id: @user_review
    end

    assert_redirected_to user_reviews_path
  end
end
