class LocalDeliveriesController < ApplicationController
  before_action :set_local_delivery, only: [:show, :edit, :update, :destroy]
  before_action :set_local

  respond_to :html

  def index
    # @local_deliveries = LocalDelivery.all
    # respond_with(@local_deliveries)
    
    @local_deliveries = @local.local_deliveries.paginate(:page => params[:page], :per_page => 5)
    respond_with(@local, @local_deliveries)
  end

  def show
    # respond_with(@local_delivery)
    respond_with(@local, @local_delivery)
  end

  def new
    # @local_delivery = LocalDelivery.new
    # respond_with(@local_delivery)
    
    @local_delivery = @local.local_deliveries.new
    respond_with(@local, @local_delivery)
  end

  def edit
  end

  def create
    # @local_delivery = LocalDelivery.new(local_delivery_params)
    # @local_delivery.save
    # respond_with(@local_delivery)
    
    @local_delivery = @local.local_deliveries.new(local_delivery_params)
    @local_delivery.save
    redirect_to restaurant_local_local_deliveries_path(@local.restaurant, @local)
  end

  def update
    # @local_delivery.update(local_delivery_params)
    # respond_with(@local_delivery)
    
    @local_delivery.update(local_delivery_params)
    redirect_to restaurant_local_local_deliveries_path(@local.restaurant, @local)
  end

  def destroy
    # @local_delivery.destroy
    # respond_with(@local_delivery)
    
    @local_delivery.destroy
    redirect_to restaurant_local_local_deliveries_path(@local.restaurant, @local)
  end

  private
    def set_local_delivery
      @local_delivery = LocalDelivery.find(params[:id])
    end
    
    def set_local
      @local = Local.find(params[:local_id])
    end

    def local_delivery_params
      params.require(:local_delivery).permit(:start_time, :end_time, :local_id, :district_id)
    end
end
