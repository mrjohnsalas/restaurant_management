class UserReviewsController < ApplicationController
  before_action :set_user_review, only: [:show, :edit, :update, :destroy]
  before_action :set_item
  before_action :set_restaurant
  
  respond_to :html

  def index
    # @user_reviews = UserReview.all
    # respond_with(@user_reviews)
    if @item != nil
      @user_reviews = @item.user_reviews.paginate(:page => params[:page], :per_page => 5)
      respond_with(@item, @user_reviews)
    else
      @user_reviews = @restaurant.user_reviews.paginate(:page => params[:page], :per_page => 5)
      respond_with(@restaurant, @user_reviews)
    end
  end

  def show
    #respond_with(@user_review)
    if @item != nil
      respond_with(@item, @user_review)
    else
      respond_with(@restaurant, @user_review)
    end
  end

  def new
    #@user_review = UserReview.new
    #respond_with(@user_review)
    if @item != nil
      @user_review = @item.user_reviews.new
      respond_with(@item, @user_review)
    else
      @user_review = @restaurant.user_reviews.new
      respond_with(@restaurant, @user_review)
    end
  end

  def edit
  end

  def create
    #@user_review = UserReview.new(user_review_params)
    #@user_review.save
    #respond_with(@user_review)
    if @item != nil
      @user_review = @item.user_reviews.new(user_review_params)
      @user_review.object_type_id = @item.object_type_id
      @user_review.save
      redirect_to restaurant_item_user_reviews_path(@item.restaurant, @item)
    else
      @user_review = @restaurant.user_reviews.new(user_review_params)
      @user_review.object_type_id = @restaurant.object_type_id
      @user_review.save
      redirect_to restaurant_user_reviews_path(@restaurant)
    end
  end

  def update
    #@user_review.update(user_review_params)
    #respond_with(@user_review)
    if @item != nil
      @user_review.update(user_review_params)
      redirect_to restaurant_item_user_reviews_path(@item.restaurant, @item)
    else
      @user_review.update(user_review_params)
      redirect_to restaurant_user_reviews_path(@restaurant)
    end
  end

  def destroy
    #@user_review.destroy
    #respond_with(@user_review)
    if @item != nil
      @user_review.destroy
      redirect_to restaurant_item_user_reviews_path(@item.restaurant, @item)
    else
      @user_review.destroy
      redirect_to restaurant_user_reviews_path(@restaurant)
    end
  end

  private
    def set_user_review
      @user_review = UserReview.find(params[:id])
    end
    
    def set_restaurant
      @restaurant = Restaurant.find(params[:restaurant_id])
    end
    
    def set_item
      if params[:item_id] != nil
        @item = Item.find(params[:item_id])
      end
    end

    def user_review_params
      params.require(:user_review).permit(:rating, :comment, :object_type_id, :user_id, :item_id, :restaurant_id)
    end
end
