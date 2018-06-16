require_relative 'plane'

class Airport

  def initialize
    @planes_at_airport = []
    @planes_in_sky = []
  end

  def land(plane)
    @plane = plane
    @planes_at_airport << plane
  end

  attr_reader :plane

  def take_off(plane)
    @plane = plane
    @planes_at_airport.pop
    @planes_in_sky << plane
  end

end
