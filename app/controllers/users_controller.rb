class UsersController < ApplicationController

before_action :authenticate_user!
before_action :correct_user, only: [:update,:edit]

def show
  @user = User.find(params[:id])
  @posts = @user.posts
end

def edit
  @user = User.find(params[:id])
end

def update
  @user = User.find(params[:id])
  @user.update(user_params)
  redirect_to user_path(@user.id)
end

def correct_user
  @user = User.find(params[:id])
 unless @user.id == current_user.id
  redirect_to root_path
 end
end

  private

def user_params
  params.require(:user).permit(:name, :email)
end

end
