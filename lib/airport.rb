require "./lib/plane.rb"
require "./lib/weather.rb"

class Airport

  def instruct_land(plane)
     plane.landed
  end

  def instruct_takeoff(plane)
    weather = Weather.new
    weather.stormy_weather ? plane.landed : plane.takeoff
  end


end
