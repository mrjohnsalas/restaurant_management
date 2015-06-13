class RestaurantsController < ApplicationController
  before_action :set_restaurant, only: [:show, :edit, :update, :destroy, :upvote, :downvote]

  respond_to :html
  
  def index
	    if params[:search]
		    @restaurants = Restaurant.all.search(params[:search]).paginate(:page => params[:page], :per_page => 5)
	    else
		    @restaurants = Restaurant.all.paginate(:page => params[:page], :per_page => 5)
	    end
  end

  def show
    @user_reviews = UserReview.where(restaurant_id: @restaurant.id).order("created_at DESC")

    if @user_reviews.blank?
      @avg_review = 0
    else
      @avg_review = @user_reviews.average(:rating).round(2)
    end
  end

  def new
    @restaurant = current_user.restaurants.build
    respond_with(@restaurant)
  end

  def edit
  end

  def create
    @restaurant = current_user.restaurants.build(restaurant_params)
    @restaurant.object_type_id = 1
    @restaurant.save
    respond_with(@restaurant)
  end

  def update
    @restaurant.update(restaurant_params)
    respond_with(@restaurant)
  end

  def destroy
    @restaurant.destroy
    respond_with(@restaurant)
  end
  
  def upvote
    @restaurant.upvote_by current_user
    redirect_to :back
  end

  def downvote
    @restaurant.downvote_from current_user
    redirect_to :back
  end

  private
    def set_restaurant
      @restaurant = Restaurant.find(params[:id])
    end

    def restaurant_params
      params.require(:restaurant).permit(:name, :phone_1, :phone_2, :email_1, :email_2, :web_page, :facebook, :twitter, :instagram, :allow_point, :min_points, :user_id, :object_type_id, :logo)
    end
end
