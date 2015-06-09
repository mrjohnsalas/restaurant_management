class OrderCardsController < ApplicationController
  before_action :set_order_card, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @order_cards = OrderCard.all
    respond_with(@order_cards)
  end

  def show
    respond_with(@order_card)
  end

  def new
    @order_card = OrderCard.new
    respond_with(@order_card)
  end

  def edit
  end

  def create
    @order_card = OrderCard.new(order_card_params)
    @order_card.save
    respond_with(@order_card)
  end

  def update
    @order_card.update(order_card_params)
    respond_with(@order_card)
  end

  def destroy
    @order_card.destroy
    respond_with(@order_card)
  end

  private
    def set_order_card
      @order_card = OrderCard.find(params[:id])
    end

    def order_card_params
      params.require(:order_card).permit(:order_id, :user_card_id)
    end
end
