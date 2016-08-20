require_relative 'plane'
require_relative 'weather'

class Airport

  attr_reader :planes

  def initialize
    @planes = []
  end

  def land(plane)
    plane.ground
    planes << plane
  end

  def take_off(plane)
    fail "Ach no, there's a storm a-brewin'!" if bad_weather
    plane.fly
    planes.delete(plane)
  end

  def bad_weather
    Weather.new.stormy
  end

end
