require 'plane'
require 'airport'

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

  def can_land?
    weather_clear? && !@airport.capacity_max?
  end

  def try_land(plane)
    @airport.land_plane(plane) if can_land?
  end

  def can_take_off?(plane)
    return weather_clear? && @airport.in_airport?(plane)
  end

  def try_take_off(plane)
    @airport.take_off_plane(plane) if weather_clear? && @airport.in_airport?(plane)
  end

end
