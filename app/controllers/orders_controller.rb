class OrdersController < ApplicationController
  before_action :set_order, only: [:show, :edit, :update, :destroy, :save_all]

  respond_to :html
  
  def index
	  if params[:search] and params[:search] != "" 
		  @orders = Order.all.search(params[:search]).paginate(:page => params[:page], :per_page => 5)
	  else
		  @orders = Order.all.order(order_date: :desc).paginate(:page => params[:page], :per_page => 5)
	  end
  end

  def show
    respond_with(@order)
  end

  def new
    @order = current_user.orders.build
    @shopping_carts = current_user.shopping_carts.all
    @addresses = current_user.user_addresses.all
    @cards = current_user.user_cards.all
    respond_with(@order)
  end

  def edit
  end

  def create
    
      #OBTENGO TODOS LOS ITEMS DE MI CARRITO DE COMPRAS
      @shopping_carts = current_user.shopping_carts.all
      
      #CREO LA ORDEN
      @order = current_user.orders.build(order_params)
      @order.order_date = Date.today
      @order.local_id = @shopping_carts.first.menu.local_id
      @order.save
      
      #CREO EL DETALLE DE LA ORDEN
      @shopping_carts.each do |f|
        @order_detail = OrderDetail.new
        @order_detail.quantity = f.quantity
        @order_detail.unit_price = f.menu.item.unit_price
        @order_detail.total = f.quantity * f.menu.item.unit_price
        @order_detail.order_id = @order.id
        @order_detail.menu_id = f.menu_id
        
        #BUSCO MENU PARA REDUCIR STOCK
        @menu = Menu.find(f.menu_id)
        if @shopping_carts != nil
          @menu.update_attributes(:stock => @menu.stock - f.quantity)
        end
        
        @order_detail.save
      end
    
      #CREO EL DELIVERY DE LA ORDEN
      @order_delivery = nil
      if params[:user_address] and params[:user_address] != ""
        @order_delivery = OrderDelivery.new
        @order_delivery.order_id = @order.id
        @order_delivery.user_address_id = params[:user_address].to_i
        @order_delivery.save
      end
    
      #CREO LA TARJETA DE LA ORDEN
      @order_card = nil
      if params[:user_cards] and params[:user_cards] != "" and @order.payment_type_id == 1
        @order_card = OrderCard.new
        @order_card.order_id = @order.id
        @order_card.user_card_id = params[:user_cards].to_i
        @order_card.save
      end
    
      #CREO EL USER POINT
      if @order.payment_type_id != 2
        @user_point = UserPoint.find_by(restaurant_id: @order.local.restaurant_id)
        if @user_point == nil
          @user_point = current_user.user_points.build
          @user_point.quantity = 1
          @user_point.restaurant_id = @order.local.restaurant_id
          @user_point.save
        else
          @quantity = @user_point.quantity + 1
          @user_point.update_attributes(:quantity => @quantity)
        end
      end
    
      #Order.save_all(@order_delivery, @order_card)
    
      flash[:notice] = "Order Ok!"
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
