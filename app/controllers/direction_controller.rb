class DirectionController < ApplicationController

  def show
    url = "https://maps.googleapis.com/maps/api/directions/json?origin=#{params[:origin]}&destination=#{params[:destination]}&key=AIzaSyAQCsSJwynJ67ODIv0ZgGwCffJSChdvB9o"

    response = HTTParty.get(url)
    parsed = response.parsed_response
    my_response = {}
    my_reponse["routes"] = parsed["routes"]
    render json: my_response["routes"]
    # response = HTTParty.get(url)
    # render json: response.parsed_response
  end


end
