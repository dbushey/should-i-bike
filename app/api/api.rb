module Api

  def googleDirections(origin, destination)
    url = "https://maps.googleapis.com/maps/api/directions/json?origin=#{origin}&destination=#{destination}&mode=bicycling&key=AIzaSyAQCsSJwynJ67ODIv0ZgGwCffJSChdvB9o"

    # localhost:3000/direction?origin=1176+Greene+Avenue+Brooklyn+NY&destination=28W+23rd+St+New%20York+NY&departure_time=now

    response = HTTParty.get(url)
    my_response = {}
    # my_response["duration"] = response["routes"][0]["legs"][0] ["duration"]["text"]
    my_response["start_location"] = response["routes"][0]["legs"][0]["start_location"]
    my_response["end_location"] = response["routes"][0]["legs"][0]["end_location"]

    my_response
  end

  def darksky(lat, lng, departure_time)
    url = "https://api.darksky.net/forecast/668446174c1c15bb92c097fc64d9b4ce/#{lat},#{lng},#{departure_time}?exclude=currently,minutely,daily,flags"

    # byebug
    response = HTTParty.get(url)
    my_response = {}
    response.parsed_response
  end

end
