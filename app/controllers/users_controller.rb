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
      session[:user_id] = @user.id
      redirect_to user_path(@user)
    else
      flash[:error] = "Invalid login credentials"
      render 'new'
    end
  end

  def edit
    @user = current_user
  end

  def update
    if current_user.update_attributes(user_params)
      redirect_to user_path(current_user)
    else
      render 'edit'
    end
  end

  def show
    @user = User.find(params[:id])
  end

  def destroy
    User.find(params[:id]).destroy
    session[:user_id] = nil
    redirect_to root_path
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation)
  end

end
