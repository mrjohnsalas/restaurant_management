class UserPointsController < ApplicationController
  before_action :set_user_point, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @user_points = UserPoint.all.paginate(:page => params[:page], :per_page => 5)
    respond_with(@user_points)
  end

  def show
    respond_with(@user_point)
  end

  def new
    @user_point = current_user.user_points.build
    respond_with(@user_point)
  end

  def edit
  end

  def create
    @user_point = current_user.user_points.build(user_point_params)
    @user_point.save
    respond_with(@user_point)
  end

  def update
    @user_point.update(user_point_params)
    respond_with(@user_point)
  end

  def destroy
    @user_point.destroy
    respond_with(@user_point)
  end

  private
    def set_user_point
      @user_point = UserPoint.find(params[:id])
    end

    def user_point_params
      params.require(:user_point).permit(:quantity, :restaurant_id, :user_id)
    end
end
