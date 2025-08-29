class Admin::UsersController < ApplicationController
  layout 'admin'
  before_action :authenticate_admin!

  def index
    @users = User.all
  end

  def destroy
    @user = User.find(params[:id])
    flash[:notice] = "削除に成功しました。"
    @user.destroy
    redirect_to admin_root_path
  end
end
