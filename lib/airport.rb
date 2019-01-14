require_relative 'plane'

class Airport
  attr_reader :weather, :planes
  DEFAULT_CAPACITY = 20

  def initialize(capacity = DEFAULT_CAPACITY)
    @weather = "Sunny"
    @planes = []
    @capacity = capacity
  end

  def change_weather
    roll == 6 ? @weather = "Stormy" : @weather = "Sunny"
  end

  def roll
    rand(1..6)
  end

  def take_off(plane)
    weather_check
    @planes.delete(plane)
    plane.swap_state
    "Plane #{plane.flight_number} has taken off from the airport"
  end

  def land(plane)
    weather_check
    capacity_check
    @planes << plane
    plane.swap_state
    "Plane #{plane.flight_number} has landed at the airport"
  end

  def weather_check
    raise "Stormy weather prohibits actions" if @weather == "Stormy"
  end

  def capacity_check
    raise "Airport is at maximum capacity" if @planes.size >= @capacity
  end

end
