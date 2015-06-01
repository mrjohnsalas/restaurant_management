class DistrictsController < ApplicationController
  before_action :set_district, only: [:show, :edit, :update, :destroy]
  before_action :set_province
  
  respond_to :html
  
  # GET /districts
  # GET /districts.json
  def index
    @districts = @province.districts.paginate(:page => params[:page], :per_page => 5)
    respond_with(@province, @districts)
  end

  # GET /districts/1
  # GET /districts/1.json
  def show
    respond_with(@province, @district)
  end

  # GET /districts/new
  def new
    @district = @province.districts.new
    respond_with(@province, @district)
  end

  # GET /districts/1/edit
  def edit
  end

  # POST /districts
  # POST /districts.json
  def create
    @district = @province.districts.new(district_params)
    @district.save
    redirect_to country_province_districts_path(@province.country, @province)

    # respond_to do |format|
    #   if @district.save
    #     format.html { redirect_to @district, notice: 'District was successfully created.' }
    #     format.json { render :show, status: :created, location: @district }
    #   else
    #     format.html { render :new }
    #     format.json { render json: @district.errors, status: :unprocessable_entity }
    #   end
    # end
  end

  # PATCH/PUT /districts/1
  # PATCH/PUT /districts/1.json
  def update
    @district.update(district_params)
    redirect_to country_province_districts_path(@province.country, @province)
    # respond_to do |format|
    #   if @district.update(district_params)
    #     format.html { redirect_to @district, notice: 'District was successfully updated.' }
    #     format.json { render :show, status: :ok, location: @district }
    #   else
    #     format.html { render :edit }
    #     format.json { render json: @district.errors, status: :unprocessable_entity }
    #   end
    # end
  end

  # DELETE /districts/1
  # DELETE /districts/1.json
  def destroy
    @district.destroy
    redirect_to country_province_districts_path(@province.country, @province)
    # respond_to do |format|
    #   format.html { redirect_to districts_url, notice: 'District was successfully destroyed.' }
    #   format.json { head :no_content }
    # end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_district
      @district = District.find(params[:id])
    end

    def set_province
      @province = Province.find(params[:province_id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def district_params
      params.require(:district).permit(:name, :province_id)
    end
end
