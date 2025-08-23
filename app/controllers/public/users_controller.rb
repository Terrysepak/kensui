class Public::UsersController < ApplicationController
  before_action :authenticate_user!, only: [:edit, :update, :destroy]
  before_action :correct_user, only: [:edit, :update, :destroy]

  def show
    @user = User.find(params[:id])
    @parks = @user.parks
  end

  def edit
  end

  def update
    if @user.update(user_params)
      flash[:notice] = "更新に成功しました。"
      redirect_to @user
    else
      flash.now[:alert] = "失敗しました。"
      render :show
    end
  end

  def destroy
    flash[:notice] = "削除に成功しました。"
    @user.destroy
    redirect_to root_path
  end

  private

  def user_params
    params.require(:user).permit(:name)
  end

  def correct_user
    @user = User.find_by_id(params[:id])
    redirect_to root_path if !@user || current_user != @user
  end
end
