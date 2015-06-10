class OrderDeliveriesController < ApplicationController
  before_action :set_order_delivery, only: [:show, :edit, :update, :destroy]
  before_action :set_order
  
  respond_to :html

  def index
    @order_deliveries = @order.order_deliveries.paginate(:page => params[:page], :per_page => 5)
  end

  def show
    respond_with(@order, @order_delivery)
  end

  def new
    @order_delivery = @order.order_deliveries.new
    respond_with(@order, @order_delivery)
  end

  def edit
  end

  def create
    @order_delivery = @order.order_deliveries.new(order_delivery_params)
    @order_delivery.save
    redirect_to order_order_deliveries_path(@order)
  end

  def update
    @order_delivery.update(order_delivery_params)
    redirect_to order_order_deliveries_path(@order)
  end

  def destroy
    @order_delivery.destroy
    redirect_to order_order_deliveries_path(@order)
  end

  private
    def set_order_delivery
      @order_delivery = OrderDelivery.find(params[:id])
    end
    
    def set_order
      @order = Order.find(params[:order_id])
    end

    def order_delivery_params
      params.require(:order_delivery).permit(:order_id, :user_address_id)
    end
end
