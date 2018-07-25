class DirectionController < ApplicationController
  include Api

  def show
    # byebug
    maps_response = googleMaps(params[:origin], params[:destination], params[:departure_time])
    # maps_response is an obj with key duration with text value
    # {
    #   "duration": "44 mins",
    #   "start_location": {
    #     "lat": 40.6947767,
    #     "lng": -73.9227362
    #   },
    #   "end_location": {
    #     "lat": 40.7413796,
    #     "lng": -73.99124239999999
    #   }
    # }

    my_response = {}

    origin_weather = darksky(maps_response["start_location"]["lat"], maps_response["start_location"]["lng"], Time.now().to_i)

    my_response["origin_icon"] = origin_weather["hourly"]["data"][0]["icon"]

    my_response["origin_summary"] = origin_weather["hourly"]["data"][0]["summary"]

    dest_weather = darksky(maps_response["end_location"]["lat"], maps_response["end_location"]["lng"], Time.now().to_i)

    my_response["dest_icon"] = dest_weather["hourly"]["data"][0]["icon"]

    my_response["dest_summary"] = dest_weather["hourly"]["data"][0]["summary"]

    # yes_weathers = ["clear-day", "clear-night", "wind", "fog", "cloudy", "partly-cloudy-day", "partly-cloudy-night"]

    no_weathers = ["rain", "snow", "sleet"]

    my_response["final_answer"] = "Yes"

    if no_weathers.include?(my_response["origin_icon"])
      my_response["final_answer"] = "No"
    end


    render json: my_response
    # {origin_icon: "rain", origin_summary: "Rain", dest_icon: "rain", dest_summary: "Rain", final_answer: "No"}
  end

end

# NOTES TO DEAL WITH TIME LATER

# arrival_time — Specifies the desired time of arrival for transit directions, in seconds since midnight, January 1, 1970 UTC. You can specify either departure_time or arrival_time, but not both. Note that arrival_time must be specified as an integer.

# For each UNIX timestamp, there is a corresponding local time for each and every different timezone. For example, the UNIX time 1466892000 corresponds to 6PM (18:00) in New York, 10PM (22:00) GMT, and midnight (00:00) of the following day in Amsterdam. When converting UNIX timestamps to local times, always use the timezone property of the API response, so that your software knows which timezone is the right one.

# Ruby: Convert epoch to human readable date
# Time.at(1532052351)
# => 2018-07-19 22:05:51 -0400
# Ruby: Convert human readable date to epoch
# t = Time.new(2018, 7, 23, 12, 15)
# t.to_i
