require_relative 'plane'

class Airport

  attr_accessor :planes

  def initialize
    @planes = []
  end

  def request_landing(plane)
    plane.landing
    planes << plane
  end

  def request_takeoff(plane)
    plane.take_off
    planes.shift
  end
end
# Write up an initialize test
