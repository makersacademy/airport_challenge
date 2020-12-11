require 'Plane'
require 'Airport'

class TrafficController
  attr_reader :airport

  def initialize
    @airport = Airport.new
    randomise_weather
  end

  def weather_clear?
    return @weather == "clear"
  end

  def override_weather(new_weather)
    @weather = new_weather
  end

  def randomise_weather
    possibilities = ["clear", "clear", "clear", "clear", "stormy"]
    @weather = possibilities.sample
    # 20% chance of storm
  end

end