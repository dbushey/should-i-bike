class ForecastController < ApplicationController

  def show
    url = "https://api.darksky.net/forecast/668446174c1c15bb92c097fc64d9b4ce/#{params[:lat]},#{params[:lng]}?exclude=currently,minutely,daily,flags"

    response = HTTParty.get(url)
    render json: response.parsed_response
  end


end
