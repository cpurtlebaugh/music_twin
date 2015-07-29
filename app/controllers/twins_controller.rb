class TwinsController < ApplicationController

  def index
    @twins = Twin.search_by_name(params[:query])
  end

end
