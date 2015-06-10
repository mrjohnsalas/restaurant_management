class Order < ActiveRecord::Base
  belongs_to :local
  belongs_to :user
  belongs_to :payment_type
  has_many :order_details, dependent: :destroy
  has_many :order_cards, dependent: :destroy
  has_many :order_deliveries, dependent: :destroy
  
  def self.search(search)
    if search and search != ""
      selected_date = Date.parse(search)
      where(:order_date => selected_date.beginning_of_day..selected_date.end_of_day)
    end
  end
  
  def save_all(order_delivery, order_card)
    begin
      
      ActiveRecord::Base.transaction do
        #OBTENGO TODOS LOS ITEMS DE MI CARRITO DE COMPRAS
        @shopping_carts = current_user.shopping_carts.all
        if (@shopping_carts.nil? or @shopping_carts.length == 0)
          raise ActiveRecord::Rollback, "No items in your shopping cart!"
        end
        
        #GRABO LA ORDEN
        self.order_date = Date.today
        self.local_id = @shopping_carts.first.menu.local_id
        self.save
        
        #CREO EL DETALLE DE LA ORDEN
        @shopping_carts.each do |f|
          @order_detail = OrderDetail.new
          @order_detail.quantity = f.quantity
          @order_detail.unit_price = f.menu.item.unit_price
          @order_detail.total = f.quantity * f.menu.item.unit_price
          @order_detail.order_id = self.id
          @order_detail.menu_id = f.menu_id
          
          #BUSCO MENU PARA REDUCIR STOCK
          @menu = Menu.find(f.menu_id)
          if @shopping_carts.nil?
            raise ActiveRecord::Rollback, "The menu not found!"
          elsif @menu.stock == 0
            raise ActiveRecord::Rollback, "The menu has no stock!"
          else
            @menu.update_attributes(:stock => @menu.stock - f.quantity)
          end
          
          @order_detail.save
        end
        
        # #CREO EL DELIVERY DE LA ORDEN
        # if order_delivery.nil?
        #   raise ActiveRecord::Rollback, "The order has no delivery address!"
        # else
        #   order_delivery.order_id = self.id
        #   order_delivery.save
        # end
        
        # #CREO LA TARJETA CREDITO DE LA ORDEN
        # if order_card != nil
        #   order_card.order_id = self.id
        #   order_card.save
        # end
        
        # #CREO EL USER POINT
        # @user_point = UserPoint.find_by(restaurant_id: self.local.restaurant_id)
        # if self.payment_type_id == 2
        #   if @user_point == nil
        #     raise ActiveRecord::Rollback, "No points for this restaurant!"
        #   elsif self.local.restaurant.allow_point == false
        #     raise ActiveRecord::Rollback, "The restaurant does not accept user points!"
        #   elsif @user_point.quantity < self.local.restaurant.min_points
        #     raise ActiveRecord::Rollback, "You do not have sufficient user points!"
        #   else
        #     @user_point.update_attributes(:quantity => @user_point.quantity - self.local.restaurant.min_points)
        #   end
        # else
        #   if @user_point == nil
        #     @user_point = current_user.user_points.build
        #     @user_point.quantity = 1
        #     @user_point.restaurant_id = self.local.restaurant_id
        #     @user_point.save
        #   else
        #     @user_point.update_attributes(:quantity => @user_point.quantity + 1)
        #   end
        # end
        
      end
    rescue => error
      puts error.backtrace.inspect
    end
  end
  
  # def transfer_stock_to(inventory_id, transfer_stock)
  #   begin
  #     to_inventory = Inventory.find(inventory_id)
  #     ActiveRecord::Base.transaction do
  #       raise ActiveRecord::Rollback if (to_inventory.nil? or transfer_stock.nil?)
  #         # stock transfer between inventories
  #         self.update_attributes!(stock: self.stock - transfer_stock)
  #         to_inventory.update_attributes!(stock: to_inventory.stock + transfer_stock)
  #       end
  #   rescue => error
  #       puts error.backtrace.inspect
  #   end
  # end
  
end