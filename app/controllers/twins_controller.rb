class TwinsController < ApplicationController

  def index
    @twins = Twin.search_by_name(params[:query])
  end

  def add
    twin = Twin.find(params[:id])
    unless current_user.twins.include? twin
      current_user.twins << twin
    end
    redirect_to user_path(current_user)
  end

  def remove
    current_user.twins.delete(Twin.find(params[:id]))
    redirect_to user_path(current_user)
  end

end
