require_relative 'plane'
require_relative 'weather'

class Airport

  attr_accessor :planes

  def initialize
    @planes = []
  end

  def request_landing(plane, weather)
    #fail 'It is too stormy to land' if Weather.storms? / 2 == 0
    #weather.storms?
    plane.landing
    planes << plane
  end

  def request_takeoff(plane, weather)
    plane.take_off
    planes.shift
  end
end
# Write up an initialize test
