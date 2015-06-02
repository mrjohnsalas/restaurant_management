class ItemsController < ApplicationController
  before_action :set_item, only: [:show, :edit, :update, :destroy, :upvote, :downvote]
  before_action :set_restaurant
  
  respond_to :html

  def index
    # @items = Item.all
    # respond_with(@items)
    
    @items = @restaurant.items.paginate(:page => params[:page], :per_page => 5)
    respond_with(@restaurant, @items)
  end

  def show
    # respond_with(@item)
    #respond_with(@restaurant, @item)
    @user_reviews = UserReview.where(item_id: @item.id).order("created_at DESC")

    if @user_reviews.blank?
      @avg_review = 0
    else
      @avg_review = @user_reviews.average(:rating).round(2)
    end
  end

  def new
    # @item = Item.new
    # respond_with(@item)
    
    @item = @restaurant.items.new
    respond_with(@restaurant, @item)
  end

  def edit
  end

  def create
    # @item = Item.new(item_params)
    # @item.save
    # respond_with(@item)
    
    @item = @restaurant.items.new(item_params)
    @item.save
    redirect_to restaurant_items_path(@restaurant)
  end

  def update
    # @item.update(item_params)
    # respond_with(@item)
    
    @item.update(item_params)
    redirect_to restaurant_items_path(@restaurant)
  end

  def destroy
    # @item.destroy
    # respond_with(@item)
    
    @item.destroy
    redirect_to restaurant_items_path(@restaurant)
  end
  
  def upvote
    @item.upvote_by current_user
    redirect_to :back
  end
  
  def downvote
    @item.downvote_from current_user
    redirect_to :back
  end

  private
    def set_item
      @item = Item.find(params[:id])
    end
    
    def set_restaurant
      @restaurant = Restaurant.find(params[:restaurant_id])
    end

    def item_params
      params.require(:item).permit(:name, :unit_cost, :unit_price, :restaurant_id, :item_category_id, :food_category_id, :object_type_id, :photo)
    end
end
