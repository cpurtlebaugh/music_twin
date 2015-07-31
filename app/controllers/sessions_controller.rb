class SessionsController < ApplicationController

  def new
  end

## method to create a user's session to be stored in a cookie when they login
  def create
    user = User.find_by(email: params[:email])
      if user && user.authenticate(params[:password])
        session[:user_id] = user.id
        redirect_to user_path(user.id), notice: "Welcome #{user.first_name}, you're logged in"
      else
        flash.now.alert = "Invalid login credentials"
        render 'new'
      end
    end

## method to destroy a user's session when they logout
  def destroy
    session[:user_id] = nil
    redirect_to root_path, :notice => "Logged out!"
  end

end
