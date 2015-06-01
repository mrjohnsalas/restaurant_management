class UserCardsController < ApplicationController
  before_action :set_user_card, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @user_cards = UserCard.all.paginate(:page => params[:page], :per_page => 5)
    respond_with(@user_cards)
  end

  def show
    respond_with(@user_card)
  end

  def new
    @user_card = current_user.user_cards.build
    respond_with(@user_card)
  end

  def edit
  end

  def create
    @user_card = current_user.user_cards.build(user_card_params)
    @user_card.save
    respond_with(@user_card)
  end

  def update
    @user_card.update(user_card_params)
    respond_with(@user_card)
  end

  def destroy
    @user_card.destroy
    respond_with(@user_card)
  end

  private
    def set_user_card
      @user_card = UserCard.find(params[:id])
    end

    def user_card_params
      params.require(:user_card).permit(:card_number, :is_default, :credit_card_type_id, :user_id)
    end
end
