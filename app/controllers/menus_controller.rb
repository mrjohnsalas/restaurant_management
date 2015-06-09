class MenusController < ApplicationController
  before_action :set_menu, only: [:show, :edit, :update, :destroy]
  before_action :set_local
  
  respond_to :html
  
  def index
	  if params[:search] and params[:search] != "" 
		  @menus = @local.menus.search(params[:search]).paginate(:page => params[:page], :per_page => 5)
	  else
		  @menus = @local.menus.order(menu_date: :desc).paginate(:page => params[:page], :per_page => 5)
	  end
  end

  # def index
  #   # @menus = Menu.all
  #   # respond_with(@menus)
    
  #   @menus = @local.menus.paginate(:page => params[:page], :per_page => 5)
  #   respond_with(@local, @menus)
  # end

  def show
    # respond_with(@menu)
    respond_with(@local, @menu)
  end

  def new
    # @menu = Menu.new
    # respond_with(@menu)
    
    @menu = @local.menus.new
    respond_with(@local, @menu)
  end

  def edit
  end

  def create
    # @menu = Menu.new(menu_params)
    # @menu.save
    # respond_with(@menu)
    @menu = @local.menus.new(menu_params)
    @menu.save
    redirect_to restaurant_local_menus_path(@local.restaurant, @local)
  end

  def update
    # @menu.update(menu_params)
    # respond_with(@menu)
    
    @menu.update(menu_params)
    redirect_to restaurant_local_menus_path(@local.restaurant, @local)
  end

  def destroy
    # @menu.destroy
    # respond_with(@menu)
    
    @menu.destroy
    redirect_to restaurant_local_menus_path(@local.restaurant, @local)
  end
  
  def shop
	  if params[:search] and params[:search] != "" 
	    if Date.parse(params[:search]) == Date.today
	      @today = true
	    else
	      @today = false
	    end
		  @menus = @local.menus.search(params[:search]).paginate(:page => params[:page], :per_page => 5)
	  else
	    @today = true
		  @menus = @local.menus.search(Date.today.to_s).paginate(:page => params[:page], :per_page => 5)
	  end
  end
  
  def add_to_shopping_cart
    @menus = @local.menus.find(params[:menu_ids])
    params[:quantities].delete("0")
    i = 0
    @menus.each do |menu|
      @shopping_cart = ShoppingCart.find_by(user_id: current_user.id, menu_id: menu.id)
      if @shopping_cart != nil
        @shopping_cart.quantity += params[:quantities][i].to_i  
        @shopping_cart.save
      else
        @shopping_cart = current_user.shopping_carts.new
        @shopping_cart.menu_id = menu.id
        @shopping_cart.quantity = params[:quantities][i]
        @shopping_cart.save
      end
      i += 1
    end
    flash[:notice] = "Updated menus!"
    redirect_to shopping_carts_path
  end

  private
    def set_menu
      @menu = Menu.find(params[:id])
    end
    
    def set_local
      @local = Local.find(params[:local_id])
    end

    def menu_params
      params.require(:menu).permit(:menu_date, :stock, :local_id, :item_id)
    end
end
