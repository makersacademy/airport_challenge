require './lib/plane'

class Airport

  attr_reader :plane

  def initialize
    at_the_airport = []
  end

  def land(plane)
    @plane = plane
  end

  def takeoff(plane)
    @plane = plane
  end

end
