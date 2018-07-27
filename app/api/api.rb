module Api

  def googleDirections(origin, destination, time)
    url = "https://maps.googleapis.com/maps/api/directions/json?origin=#{origin}&destination=#{destination}&departure_time=#{time}&mode=bicycling&key=AIzaSyAQCsSJwynJ67ODIv0ZgGwCffJSChdvB9o"

    # localhost:3000/direction?origin=1176+Greene+Avenue+Brooklyn+NY&destination=28W+23rd+St+New%20York+NY&departure_time=now

    response = HTTParty.get(url)
    my_response = {}
    my_response["duration"] = response["routes"][0]["legs"][0] ["duration"]["text"]
    my_response["start_location"] = response["routes"][0]["legs"][0]["start_location"]
    my_response["end_location"] = response["routes"][0]["legs"][0]["end_location"]

    my_response
  end


  def darksky(lat, lng, time)
    url = "https://api.darksky.net/forecast/668446174c1c15bb92c097fc64d9b4ce/#{lat}, #{lng}?exclude=currently,minutely,daily,flags"

    response = HTTParty.get(url)
    my_response = {}
    response.parsed_response
  end

  def googlePlaces()
    url = "https://maps.googleapis.com/maps/api/js?key=AIzaSyAQCsSJwynJ67ODIv0ZgGwCffJSChdvB9o&libraries=places"
    places_response = HTTParty.get(url)
    places_response.parsed_response
  end


end
