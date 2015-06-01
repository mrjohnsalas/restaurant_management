class MenusController < ApplicationController
  before_action :set_menu, only: [:show, :edit, :update, :destroy]
  before_action :set_local
  
  respond_to :html

  def index
    # @menus = Menu.all
    # respond_with(@menus)
    
    @menus = @local.menus.paginate(:page => params[:page], :per_page => 5)
    respond_with(@local, @menus)
  end

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
