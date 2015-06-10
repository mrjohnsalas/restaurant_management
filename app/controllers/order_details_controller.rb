class OrderDetailsController < ApplicationController
  before_action :set_order_detail, only: [:show, :edit, :update, :destroy]
  before_action :set_order
  
  respond_to :html

  def index
	  if params[:search]
		  @order_details = @order.order_details.search(params[:search]).paginate(:page => params[:page], :per_page => 5)
    else
		  @order_details = @order.order_details.paginate(:page => params[:page], :per_page => 5)
    end
  end

  def show
    respond_with(@order, @order_detail)
  end

  def new
    @order_detail = @order.order_details.new
    respond_with(@order, @order_detail)
  end

  def edit
  end

  def create
    @order_detail = @order.order_details.new(order_detail_params)
    @order_detail.save
    redirect_to order_order_details_path(@order)
  end

  def update
    @order_detail.update(order_detail_params)
    redirect_to order_order_details_path(@order)
  end

  def destroy
    @order_detail.destroy
    redirect_to order_order_details_path(@order)
  end

  private
    def set_order_detail
      @order_detail = OrderDetail.find(params[:id])
    end
    
    def set_order
      @order = Order.find(params[:order_id])
    end

    def order_detail_params
      params.require(:order_detail).permit(:quantity, :unit_price, :total, :order_id, :menu_id)
    end
end
