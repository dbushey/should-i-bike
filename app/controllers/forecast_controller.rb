class ForecastController < ApplicationController
  include Api

  def show
    response = darksky(params[:lat], params[:lng], params[:time])
    render json: response
  end


end
