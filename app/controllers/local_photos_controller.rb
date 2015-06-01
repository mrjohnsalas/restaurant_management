class LocalPhotosController < ApplicationController
  before_action :set_local_photo, only: [:show, :edit, :update, :destroy]
  before_action :set_local
  
  respond_to :html

  def index
    # @local_photos = LocalPhoto.all
    # respond_with(@local_photos)
    
    @local_photos = @local.local_photos.paginate(:page => params[:page], :per_page => 5)
    respond_with(@local, @local_photos)
  end

  def show
    # respond_with(@local_photo)
    respond_with(@local, @local_photo)
  end

  def new
    # @local_photo = LocalPhoto.new
    # respond_with(@local_photo)
    
    @local_photo = @local.local_photos.new
    respond_with(@local, @local_photo)
  end

  def edit
  end

  def create
    # @local_photo = LocalPhoto.new(local_photo_params)
    # @local_photo.save
    # respond_with(@local_photo)
    
    @local_photo = @local.local_photos.new(local_photo_params)
    @local_photo.save
    redirect_to restaurant_local_local_photos_path(@local.restaurant, @local)
  end

  def update
    # @local_photo.update(local_photo_params)
    # respond_with(@local_photo)
    
    @local_photo.update(local_photo_params)
    redirect_to restaurant_local_local_photos_path(@local.restaurant, @local)
  end

  def destroy
    # @local_photo.destroy
    # respond_with(@local_photo)
    
    @local_photo.destroy
    redirect_to restaurant_local_local_photos_path(@local.restaurant, @local)
  end

  private
    def set_local_photo
      @local_photo = LocalPhoto.find(params[:id])
    end
    
    def set_local
      @local = Local.find(params[:local_id])
    end

    def local_photo_params
      params.require(:local_photo).permit(:index, :local_id, :photo)
    end
end
