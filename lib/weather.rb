require './lib/airport.rb'
require './lib/plane.rb'

class Weather

  def weather_status
    number = rand(1..5)
    if number == 5
      "stormy"
    else
      "good"
    end
  end
end
