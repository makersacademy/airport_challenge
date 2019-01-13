require_relative 'plane'

class Airport

  DEFAULT_CAPACITY = 5

  attr_accessor :capacity

  def initialize(capacity = DEFAULT_CAPACITY)
    @planes = []
    @weather = ""
    @capacity = capacity
  end

  def land(plane)
    grounded?(plane)
    full?
    airport_weather_check
    plane.grounded
    (@planes << plane)
  end

  def take_off(plane)
    airborn?(plane)
    plane_check(plane)
    airport_weather_check
    plane.airborn
    @planes.delete(plane)
    "#{plane} has safely taken off"
  end

  def airborn?(plane)
    raise "PlaneAirbornError" if plane.flying == true
  end

  def grounded?(plane)
    raise "PlaneNotAirbornError" if plane.flying == false
  end

  def full?
    raise "AirportFullError" if @planes.count >= @capacity
  end

  def plane_check(plane)
    raise "PlaneNotInAirportError" unless @planes.include?(plane)
  end

  def random_generator
    rand(1..5)
  end

  def airport_weather_check
    random_generator == 2 ? @weather = "stormy" : @weather = "sunny"
    raise "BadWeatherError" if @weather == "stormy"
  end

end
