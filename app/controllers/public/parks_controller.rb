class Public::ParksController < ApplicationController
  def index
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
  end

  def destroy
  end

  private

  def park_params
    params.require(:park).permit(:name, :body, :address)
  end
end
