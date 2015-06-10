class OrderCardsController < ApplicationController
  before_action :set_order_card, only: [:show, :edit, :update, :destroy]
  before_action :set_order
  
  respond_to :html

  def index
    @order_cards = @order.order_cards.paginate(:page => params[:page], :per_page => 5)
  end

  def show
    respond_with(@order, @order_card)
  end

  def new
    @order_card = @order.order_cards.new
    respond_with(@order, @order_card)
  end

  def edit
  end

  def create
    @order_card = @order.order_cards.new(order_card_params)
    @order_card.save
    redirect_to order_order_cards_path(@order_card)
  end

  def update
    @order_card.update(order_card_params)
    redirect_to order_order_cards_path(@order_card)
  end

  def destroy
    @order_card.destroy
    redirect_to order_order_cards_path(@order_card)
  end

  private
    def set_order_card
      @order_card = OrderCard.find(params[:id])
    end
    
    def set_order
      @order = Order.find(params[:order_id])
    end

    def order_card_params
      params.require(:order_card).permit(:order_id, :user_card_id)
    end
end
