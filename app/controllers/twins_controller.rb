class TwinsController < ApplicationController

## method to implement and render twin query search
  def index
    @twins = Twin.search_by_name(params[:query])
  end

## method to add a twin to a user's profile
  def add
    twin = Twin.find(params[:id])
    unless current_user.twins.include? twin
      current_user.twins << twin
    end
    redirect_to user_path(current_user)
  end

## method to remove a twin from a user's profile
  def remove
    current_user.twins.delete(Twin.find(params[:id]))
    redirect_to user_path(current_user)
  end

end
