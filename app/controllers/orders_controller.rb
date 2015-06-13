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
    #@shopping_carts = current_user.shopping_carts.all
    #@addresses = current_user.user_addresses.all
    #@cards = current_user.user_cards.all
    respond_with(@order)
  end

  def edit
  end

  def create
    begin
      ActiveRecord::Base.transaction do 
        @error_message = ""
        
        #CREO LA ORDEN CON LOS PARAMETROS
        @order = current_user.orders.build(order_params)
        
        #OBTENGO TODOS LOS ITEMS DE MI CARRITO DE COMPRAS
        @shopping_carts = current_user.shopping_carts.all
        
        #SI NO TENEMOS ITEMS EN NUESTRO CARRITO HACEMOS ROLLBACK
        #raise ActiveRecord::Rollback, "No items in your shopping cart!" if (@shopping_carts.nil? or @shopping_carts.length == 0)
        if (@shopping_carts.nil? or @shopping_carts.length == 0)
          @error_message = "No items in your shopping cart!"
          raise ActiveRecord::Rollback 
        end
        
        #ORDEN => ASIGNO FECHA Y LOCAL PARA GRABAR
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
          
          #SI NO ENCONTRAMOS EL MENU HACEMOS ROLLBACK
          #raise ActiveRecord::Rollback, "The menu not found!" if @menu.nil?
          if @menu.nil?
            @error_message = "The menu not found!"
            raise ActiveRecord::Rollback
          end
          
          #SI EL MENU NO TIENE STOCK HACEMOS ROLLBACK
          #raise ActiveRecord::Rollback, "The menu has no stock!" if @menu.stock == 0
          if @menu.stock == 0
            @error_message = "The menu has no stock!"
            raise ActiveRecord::Rollback
          end
          
          #SI EL MENU NO TIENE SUFICIENTE STOCK HACEMOS ROLLBACK
          #raise ActiveRecord::Rollback, "The menu does not have sufficient stock!" if f.quantity > @menu.stock
          if f.quantity > @menu.stock
            @error_message = "The menu does not have sufficient stock!"
            raise ActiveRecord::Rollback
          end
          
          #ACTUALIZAMOS EL STOCK DEL MENU
          @menu.update_attributes(:stock => @menu.stock - f.quantity)

          #GRABAMOS EL DETALLE DE LA ORDEN
          @order_detail.save
        end
        
        #SI LA ORDEN NO TIENE DIRECCION DE ENTREGA HACEMOS ROLLBACK
        #raise ActiveRecord::Rollback, "The order has no delivery address!" if (params[:user_address].nil? or params[:user_address] == "")
        if (params[:user_address].nil? or params[:user_address] == "")
          @error_message = "The order has no delivery address!"
          raise ActiveRecord::Rollback
        end
        
        #CREO EL DELIVERY DE LA ORDEN
        @order_delivery = OrderDelivery.new
        @order_delivery.order_id = @order.id
        @order_delivery.user_address_id = params[:user_address].to_i
        @order_delivery.save
        
        #BUSCO EL USER POINT PARA ESTE RESTAURANT
        @user_point = UserPoint.find_by(restaurant_id: @order.local.restaurant_id)
        #VALIDO TIPO DE PAGO DE LA ORDEN
        #SI PAGA CON USER POINTS
        if @order.payment_type_id == 2
          #SI EL RESTAURANT NO ACEPTA USER POINTS HACEMOS ROLLBACK
          #raise ActiveRecord::Rollback, "The restaurant does not accept user points!" if @order.local.restaurant.allow_point == false
          if @order.local.restaurant.allow_point == false
            @error_message = "The restaurant does not accept user points!"
            raise ActiveRecord::Rollback
          end
          
          #SI NO TENGO USER POINTS PARA ESTE RESTAURANT HACEMOS ROLLBACK
          #raise ActiveRecord::Rollback, "No points for this restaurant!" if @user_point.nil?
          if @user_point.nil?
            @error_message = "No points for this restaurant!"
            raise ActiveRecord::Rollback
          end
          
          #SI NO TENGO SUFICIENTES USER POINTS PARA ESTE RESTAURANT HACEMOS ROLLBACK
          #raise ActiveRecord::Rollback, "You do not have sufficient user points!" if @user_point.quantity < @order.local.restaurant.min_points
          if @user_point.quantity < @order.local.restaurant.min_points
            @error_message = "You do not have sufficient user points!"
            raise ActiveRecord::Rollback
          end
          
          #ACTUALIZAMOS LA CANTIDAD DE MIS USER POINTS
          @user_point.update_attributes(:quantity => @user_point.quantity - @order.local.restaurant.min_points)
        else
          #SI PAGA CON TARJETA
          if @order.payment_type_id == 1
            #SI LA ORDEN NO TIENE CREDIT CARD HACEMOS ROLLBACK
            #raise ActiveRecord::Rollback, "The order has no credit card!" if (params[:user_cards].nil? or params[:user_cards] == "")
            if (params[:user_cards].nil? or params[:user_cards] == "")
              @error_message = "The order has no credit card!"
              raise ActiveRecord::Rollback
            end
            
            #CREO LA CREDIT CARD DE LA ORDEN
            @order_card = OrderCard.new
            @order_card.order_id = @order.id
            @order_card.user_card_id = params[:user_cards].to_i
            @order_card.save
          end
          #SI EL RESTAURANT ACEPTA USER POINTS LO CREAMOS
          if @order.local.restaurant.allow_point
            if @user_point == nil
              @user_point = current_user.user_points.build
              @user_point.quantity = 1
              @user_point.restaurant_id = @order.local.restaurant_id
              @user_point.save
            else
              @user_point.update_attributes(:quantity => @user_point.quantity + 1)
            end
          end
        end
        #ELIMINO LOS ITEMS DE MI CARRITO DE COMPRAS
        @shopping_carts.delete_all
        @is_ok = true
        @notice = "Success!"
      end
    rescue => e
      @notice = e.message
    ensure
      if @is_ok
        flash[:notice] = @notice
        respond_with(@order)
      else
        flash[:error] = @error_message
        redirect_to :back
      end
    end
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
