class TwinsController < ApplicationController

def index
  @twins = Twin.where(nil) # creates an anonymous scope
  @twins = @twins.name(params[:name]) if params[:name].present?
end

def search_name
  @twins = Twin.search_name(params[:query])
end

end
