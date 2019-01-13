require_relative 'plane'

class Airport

  DEFAULT_WEATHER = "sunny"
  DEFAULT_CAPACITY = 5

  attr_accessor :weather, :capacity, :planes

  def initialize(weather = DEFAULT_WEATHER, capacity = DEFAULT_CAPACITY)
    @planes = []
    @weather = weather
    @capacity = capacity
  end

  def land(plane)
    raise "PlaneNotAirbornError" if plane.flying == false

    raise "AirportFullError" if full?

    weather_check
    raise "BadWeatherError" if @weather == "stormy"

    plane.grounded
    (@planes << plane)
  end

  def take_off(plane)
    raise "PlaneAirbornError" if plane.flying == true

    raise "PlaneNotInAirportError" if !@planes.include?(plane)

    weather_check
    raise "BadWeatherError" if @weather == "stormy"

    plane.airborn
    @planes.delete(plane)
    "#{plane} has safely taken off"
  end

  def random_generator
    rand(1..5)
  end

  def weather_check
    random_generator == 2 ? @weather = "stormy" : @weather = "sunny"
  end

  def full?
    @planes.count >= @capacity
  end

end
