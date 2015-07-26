require_relative 'plane'
require_relative 'weather_generator'

class Airport
  include WeatherGenerator

  def initialize
      @planes = []
      @capacity=3
  end

  def clear_to_takeoff plane
    fail "No such plane in airport" if not @planes.include?(plane)
    fail "Can't take off in stormy weather" if check_weather=="stormy"
    plane.take_off
    @planes.delete(plane)
  end

  def clear_to_land plane
    fail "No space at airport" if full?
    fail "Can't land in stormy weather" if check_weather=="stormy"
    plane.land
    @planes << plane
  end

  def planes
      @planes
  end

  def capacity
    @capacity
  end

  def full?
    @planes.length>=@capacity? true : false
  end

  def check_weather
    weather_state
  end
end
