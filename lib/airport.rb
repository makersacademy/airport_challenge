require "./lib/plane.rb"
require "./lib/weather.rb"

class Airport

  def instruct_land(plane)
     plane.landed
  end

  def instruct_takeoff(plane)
    weather = Weather.new
    if weather.random_weather == true
      "You can't take off while the weather is stormy"
    else
      plane.takeoff
    end
  end


end
