require_relative 'plane'
require_relative 'weather'

class Airport

  attr_accessor :planes

  def initialize
    @planes = []
  end

  def request_landing(plane, weather)
    fail 'ERROR: it is too stormy to land' if weather.storms?
    plane.landing
    planes << plane
  end

  def request_takeoff(plane, weather)
    fail 'ERROR: it is too stormy to take off' if weather.storms?
    plane.take_off
    planes.shift
  end
end
# Write up an initialize test
