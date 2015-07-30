class UsersController < ApplicationController
  def index
    current_user = User.find_by_id(session[:user_id])
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to home_path
    else
      flash[:error] = "Invalid login credentials"
      render 'new'
    end
  end

  def show
    @user = User.find(params[:id])
  end

  def delete
    @user = User.find(params[:id]).destroy
    redirect_to root_path
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation)
  end
end
