class UsersController < ApplicationController

## inactive method
  def index
    current_user = User.find_by_id(session[:user_id])
    @users = User.all
  end

  ## method to involve sign-up process
  def new
    @user = User.new
  end

## method to post new user data to db
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

## method to edit a user's profile info such as name, email, password
  def edit
    @user = current_user
  end

## method to post the edit to a user's profile
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

## method to delete a user's profile
  def destroy
    User.find(params[:id]).destroy
    session[:user_id] = nil
    redirect_to root_path
  end


  private
## private method to define what is required / allowed to post to the db
  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation)
  end

end
