class UserFavoritesController < ApplicationController
  before_action :set_user_favorite, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @user_favorites = UserFavorite.all.paginate(:page => params[:page], :per_page => 5)
    respond_with(@user_favorites)
  end

  def show
    respond_with(@user_favorite)
  end

  def new
    @user_favorite = current_user.user_favorites.build
    respond_with(@user_favorite)
  end

  def edit
  end

  def create
    @user_favorite = current_user.user_favorites.build(user_favorite_params)
    @user_favorite.save
    respond_with(@user_favorite)
  end

  def update
    @user_favorite.update(user_favorite_params)
    respond_with(@user_favorite)
  end

  def destroy
    @user_favorite.destroy
    respond_with(@user_favorite)
  end

  private
    def set_user_favorite
      @user_favorite = UserFavorite.find(params[:id])
    end

    def user_favorite_params
      params.require(:user_favorite).permit(:user_id, :object_type_id, :object_id)
    end
end
