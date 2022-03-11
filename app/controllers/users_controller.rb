class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @articles = @user.articles
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    redirect_to user_path(@user.id)
  end

  def quit
    @user = User.find(params[:id])
  end

  def out
  @user = User.find(params[:id])
  @user.update(is_deleted: true)
  @user.articles.destroy_all
  reset_session
  flash[:notice] = "退会処理を実行いたしました"
  redirect_to root_path
  end

  private

  def user_params
    params.require(:user).permit(:name, :profile_image)
  end
end