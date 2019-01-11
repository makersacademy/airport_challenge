require_relative 'plane'

class Airport

  attr_reader :planes_at_airport

  def initialize
    @planes_at_airport = []
  end

  def land(plane)
    @planes_at_airport << plane
  end

  def take_off(plane)
    @planes_at_airport.delete(plane)
  end

end
