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
    fail 'Unsafe to fly' if random_weather != 'Sunny'
  end
end
