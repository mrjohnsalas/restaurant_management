class UserReviewsController < ApplicationController
  before_action :set_user_review, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @user_reviews = UserReview.all.paginate(:page => params[:page], :per_page => 5)
    respond_with(@user_reviews)
  end

  def show
    respond_with(@user_review)
  end

  def new
    #@user_review = UserReview.new
    @user_review = current_user.user_reviews.build
    respond_with(@user_review)
  end

  def edit
  end

  def create
    #@user_review = UserReview.new(user_review_params)
    @user_review = current_user.user_reviews.build(user_review_params)
    @user_review.save
    respond_with(@user_review)
  end

  def update
    @user_review.update(user_review_params)
    respond_with(@user_review)
  end

  def destroy
    @user_review.destroy
    respond_with(@user_review)
  end

  private
    def set_user_review
      @user_review = UserReview.find(params[:id])
    end

    def user_review_params
      params.require(:user_review).permit(:rating, :comment, :object_id, :user_id, :object_type_id)
    end
end
