class UserAddressesController < ApplicationController
  before_action :set_user_address, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @user_addresses = UserAddress.all.paginate(:page => params[:page], :per_page => 5)
    respond_with(@user_addresses)
  end

  def show
    respond_with(@user_address)
  end

  def new
    @user_address = current_user.user_addresses.build
    respond_with(@user_address)
  end

  def edit
  end

  def create
    @user_address = current_user.user_addresses.build(user_address_params)
    @user_address.save
    respond_with(@user_address)
  end

  def update
    @user_address.update(user_address_params)
    respond_with(@user_address)
  end

  def destroy
    @user_address.destroy
    respond_with(@user_address)
  end

  private
    def set_user_address
      @user_address = UserAddress.find(params[:id])
    end

    def user_address_params
      params.require(:user_address).permit(:name, :address, :is_default, :district_id, :user_id)
    end
end
