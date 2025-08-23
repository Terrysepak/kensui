class Public::ParksController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]
  before_action :correct_user, only: [:edit, :update, :destroy]

  def index
    @parks = Park.all
  end

  def show
    @park = Park.find(params[:id])
  end

  def new
    @park = Park.new
  end

  def create
    @park = current_user.parks.new(park_params)
    if @park.save
      flash[:notice] = "投稿しました"
      redirect_to @park
    else
      flash.now[:alert] = "投稿に失敗しました"
      render :new
    end
  end

  def edit
  end

  def update
    if @park.update(park_params)
      flash[:notice] = "更新に成功しました。"
      redirect_to @park
    else
      flash.now[:alert] = "失敗しました。"
      render :show
    end
  end

  def destroy
    flash[:notice] = "削除に成功しました。"
    @park.destroy
    redirect_to root_path
  end

  private

  def park_params
    params.require(:park).permit(:name, :body, :address, :review)
  end

  def correct_user
    @park = current_user.parks.find_by(id: params[:id])
    redirect_to root_url unless @park
  end
end
