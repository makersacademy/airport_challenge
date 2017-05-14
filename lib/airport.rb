require_relative 'plane'
require_relative 'weather'

class Airport
  attr_reader :plane

  def land_plane(plane)
    @plane = plane
  end

  def take_off
    Plane.new
  end

  def weather_check
    conditions = Weather.new
    conditions = conditions.random_weather
    fail 'Unsafe to fly' if conditions != 'Sunny'
  end
end
