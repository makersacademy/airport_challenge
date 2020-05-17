require './lib/plane'

class Airport

  attr_reader :plane

  def initialize
    @at_the_airport = []

  end

  def land(plane)
    @at_the_airport.push(plane)
  end

  def takeoff(plane)
    @plane = plane
  end

end
