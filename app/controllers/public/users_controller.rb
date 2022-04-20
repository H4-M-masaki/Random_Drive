class Public::UsersController < ApplicationController
  before_action :correct_user, only: [:edit]


  def show
    @user = User.find(params[:id])
    @drives = Drive.where(user_id: current_user.id)
    @posts = Post.where(user_id: current_user.id)
  end

  def edit
    @user = User.find(params[:id])
  end


  def update
   @user = User.find(params[:id])
   @user.update(user_params)
   redirect_to public_user_path(@user.id)
  end


  def quit
    @user = current_user
  end

  def out
    @user = current_user
    @user.update(is_deleted: true)
    reset_session
    flash[:notice] = "退会処理を実行いたしました。"
    redirect_to root_path
  end




  private

  def user_params
    params.require(:user).permit(:name, :email, :profile_image, :introduction)
  end

   def correct_user
    @user = User.find(params[:id])
    if current_user != @user
     redirect_to user_path(current_user)
    end
   end


end
