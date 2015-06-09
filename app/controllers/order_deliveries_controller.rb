class OrderDeliveriesController < ApplicationController
  before_action :set_order_delivery, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @order_deliveries = OrderDelivery.all
    respond_with(@order_deliveries)
  end

  def show
    respond_with(@order_delivery)
  end

  def new
    @order_delivery = OrderDelivery.new
    respond_with(@order_delivery)
  end

  def edit
  end

  def create
    @order_delivery = OrderDelivery.new(order_delivery_params)
    @order_delivery.save
    respond_with(@order_delivery)
  end

  def update
    @order_delivery.update(order_delivery_params)
    respond_with(@order_delivery)
  end

  def destroy
    @order_delivery.destroy
    respond_with(@order_delivery)
  end

  private
    def set_order_delivery
      @order_delivery = OrderDelivery.find(params[:id])
    end

    def order_delivery_params
      params.require(:order_delivery).permit(:order_id, :user_address_id)
    end
end
