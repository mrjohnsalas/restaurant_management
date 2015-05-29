class LocalsController < ApplicationController
  before_action :set_local, only: [:show, :edit, :update, :destroy]
  before_action :set_restaurant

  respond_to :html

  def index
    # @locals = Local.all
    # respond_with(@locals)
    
    @locals = @restaurant.locals
    respond_with(@restaurant, @locals)
  end

  def show
    # respond_with(@local)
    respond_with(@restaurant, @local)
  end

  def new
    # @local = Local.new
    # respond_with(@local)
    
    @local = @restaurant.locals.new
    respond_with(@restaurant, @local)
  end

  def edit
  end

  def create
    # @local = Local.new(local_params)
    # @local.save
    # respond_with(@local)
    
    @local = @restaurant.locals.new(local_params)
    @local.save
    redirect_to restaurant_locals_path(@restaurant)
  end

  def update
    # @local.update(local_params)
    # respond_with(@local)
    
    @local.update(local_params)
    redirect_to restaurant_locals_path(@restaurant)
  end

  def destroy
    # @local.destroy
    # respond_with(@local)
    
    @local.destroy
    redirect_to restaurant_locals_path(@restaurant)
  end

  private
    def set_local
      @local = Local.find(params[:id])
    end
    
    def set_restaurant
      @restaurant = Restaurant.find(params[:restaurant_id])
    end

    def local_params
      params.require(:local).permit(:name, :phone_1, :phone_2, :email_1, :email_2, :description, :allow_delivery, :allow_parking, :allow_reservation, :allow_credit_card, :restaurant_id, :district_id)
    end
end
