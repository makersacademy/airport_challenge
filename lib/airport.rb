require_relative 'plane'

class Airport

  attr_accessor :planes

  def initialize
    @planes = []
  end

  def request_landing(plane)
    fail 'Plane has already landed' if plane.status?
    planes << plane
  end

  def request_takeoff
    planes.shift
  end
end
# Write up an initialize test
