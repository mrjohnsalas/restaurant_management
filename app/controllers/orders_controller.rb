class OrdersController < ApplicationController
  before_action :set_order, only: [:show, :edit, :update, :destroy]

  respond_to :html
  
  def index
	  if params[:search] and params[:search] != "" 
		  @orders = Order.all.search(params[:search]).paginate(:page => params[:page], :per_page => 5)
	  else
		  @orders = Order.all.order(order_date: :desc).paginate(:page => params[:page], :per_page => 5)
	  end
  end

  # def index
  #   @orders = Order.all.paginate(:page => params[:page], :per_page => 5)
  #   respond_with(@orders)
  # end

  def show
    respond_with(@order)
  end

  def new
    @order = current_user.orders.build
    @shopping_carts = current_user.shopping_carts.all
    @addresses = current_user.user_addresses.all
    respond_with(@order)
  end

  def edit
  end

  def create
    @order = current_user.orders.build(order_params)
    @order.save
    respond_with(@order)
  end

  def update
    @order.update(order_params)
    respond_with(@order)
  end

  def destroy
    @order.destroy
    respond_with(@order)
  end

  private
    def set_order
      @order = Order.find(params[:id])
    end

    def order_params
      params.require(:order).permit(:order_date, :total_discount, :sub_total, :igv, :total, :local_id, :user_id, :payment_type_id)
    end
end
