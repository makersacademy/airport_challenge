require_relative 'plane'

class Airport

  attr_accessor :plane

  def initialize
    @planes = []
  end

  def request_landing(plane)
    fail 'Plane has already landed' if plane.status?
    @planes << plane
  end
end
# Write up an initialize test
