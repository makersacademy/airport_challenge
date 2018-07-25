require_relative './plane'
class Airport
  attr_reader :planes
  CAPACITY = 20

  def initialize()
    @planes = [Plane.new]
  end

  def land(plane)
    fail 'Airport full' if @planes.size >= CAPACITY
    @planes << plane
  end

  def take_off(_plane)
    fail "Bad weather: No takeoff" if weather == 'stormy'
    @planes.pop
  end

  def weather
    weather_array = ['sunny', 'sunny', 'sunny', 'sunny', 'stormy']
    @current_weather = weather_array[rand(0..4)]
    return @current_weather
  end
end
