require_relative 'plane'
class Airport
  attr_reader :airport, :plane, :amount_of_bikes
  def initialize(amount_of_planes = 0)
    @airport = []
    @amount_of_planes = amount_of_planes
  end

  def land(plane)
    @airport.push(plane)
    @plane = plane
  end

  def take_off
    @airport.pop
    return "Plane has taken off and no longer in the airport"
  end
end
