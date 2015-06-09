class PaymentTypesController < ApplicationController
  before_action :set_payment_type, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @payment_types = PaymentType.all
    respond_with(@payment_types)
  end

  def show
    respond_with(@payment_type)
  end

  def new
    @payment_type = PaymentType.new
    respond_with(@payment_type)
  end

  def edit
  end

  def create
    @payment_type = PaymentType.new(payment_type_params)
    @payment_type.save
    respond_with(@payment_type)
  end

  def update
    @payment_type.update(payment_type_params)
    respond_with(@payment_type)
  end

  def destroy
    @payment_type.destroy
    respond_with(@payment_type)
  end

  private
    def set_payment_type
      @payment_type = PaymentType.find(params[:id])
    end

    def payment_type_params
      params.require(:payment_type).permit(:name, :discount)
    end
end
