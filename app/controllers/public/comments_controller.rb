class Public::CommentsController < ApplicationController
  before_action :authenticate_user!
  before_action :correct_user, only: [:destroy]

  def create
    @comment = current_user.comments.new(comment_params)
    @park = Park.find(params[:park_id])
    @comment.park = @park
    if @comment.save
      flash[:notice] = "投稿しました"
      redirect_to @park
    else
      @comments = @park.comments
      flash.now[:alert] = "投稿に失敗しました"
      render 'public/parks/show'
    end
  end

  def destroy
    @park = Park.find(params[:park_id])
    flash[:notice] = "削除に成功しました。"
    @comment.destroy
    redirect_to @park
  end

  private

  def comment_params
    params.require(:comment).permit(:body)
  end

  def correct_user
    @comment = current_user.comments.find_by(id: params[:id])
    redirect_to root_path unless @comment
  end
end
