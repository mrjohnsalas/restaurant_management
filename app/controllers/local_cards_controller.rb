class LocalCardsController < ApplicationController
  before_action :set_local_card, only: [:show, :edit, :update, :destroy]
  before_action :set_local

  respond_to :html

  def index
    # @local_cards = LocalCard.all
    # respond_with(@local_cards)
    
    @local_cards = @local.local_cards.paginate(:page => params[:page], :per_page => 5)
    respond_with(@local, @local_cards)
  end

  def show
    # respond_with(@local_card)
    respond_with(@local, @local_card)
  end

  def new
    # @local_card = LocalCard.new
    # respond_with(@local_card)
    
    @local_card = @local.local_cards.new
    respond_with(@local, @local_card)
  end

  def edit
  end

  def create
    # @local_card = LocalCard.new(local_card_params)
    # @local_card.save
    # respond_with(@local_card)
    
    @local_card = @local.local_cards.new(local_card_params)
    @local_card.save
    redirect_to restaurant_local_local_cards_path(@local.restaurant, @local)
  end

  def update
    # @local_card.update(local_card_params)
    # respond_with(@local_card)
    
    @local_card.update(local_card_params)
    redirect_to restaurant_local_local_cards_path(@local.restaurant, @local)
  end

  def destroy
    # @local_card.destroy
    # respond_with(@local_card)
    
    @local_card.destroy
    redirect_to restaurant_local_local_cards_path(@local.restaurant, @local)
  end

  private
    def set_local_card
      @local_card = LocalCard.find(params[:id])
    end
    
    def set_local
      @local = Local.find(params[:local_id])
    end

    def local_card_params
      params.require(:local_card).permit(:local_id, :credit_card_type_id)
    end
end
