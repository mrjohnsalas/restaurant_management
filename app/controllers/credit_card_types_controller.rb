class CreditCardTypesController < ApplicationController
  before_action :set_credit_card_type, only: [:show, :edit, :update, :destroy]

  def index
	  if params[:search]
		  @credit_card_types = CreditCardType.all.search(params[:search]).paginate(:page => params[:page], :per_page => 5)
	  else
		  @credit_card_types = CreditCardType.all.paginate(:page => params[:page], :per_page => 5)
	  end
  end

  # GET /credit_card_types
  # GET /credit_card_types.json
  # def index
  #   @credit_card_types = CreditCardType.all.paginate(:page => params[:page], :per_page => 5)
  # end

  # GET /credit_card_types/1
  # GET /credit_card_types/1.json
  def show
  end

  # GET /credit_card_types/new
  def new
    @credit_card_type = CreditCardType.new
  end

  # GET /credit_card_types/1/edit
  def edit
  end

  # POST /credit_card_types
  # POST /credit_card_types.json
  def create
    @credit_card_type = CreditCardType.new(credit_card_type_params)

    respond_to do |format|
      if @credit_card_type.save
        format.html { redirect_to @credit_card_type, notice: 'Credit card type was successfully created.' }
        format.json { render :show, status: :created, location: @credit_card_type }
      else
        format.html { render :new }
        format.json { render json: @credit_card_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /credit_card_types/1
  # PATCH/PUT /credit_card_types/1.json
  def update
    respond_to do |format|
      if @credit_card_type.update(credit_card_type_params)
        format.html { redirect_to @credit_card_type, notice: 'Credit card type was successfully updated.' }
        format.json { render :show, status: :ok, location: @credit_card_type }
      else
        format.html { render :edit }
        format.json { render json: @credit_card_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /credit_card_types/1
  # DELETE /credit_card_types/1.json
  def destroy
    @credit_card_type.destroy
    respond_to do |format|
      format.html { redirect_to credit_card_types_url, notice: 'Credit card type was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_credit_card_type
      @credit_card_type = CreditCardType.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def credit_card_type_params
      params.require(:credit_card_type).permit(:name, :logo)
    end
end
