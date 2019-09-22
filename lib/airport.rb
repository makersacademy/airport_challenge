require_relative 'plane.rb'

class Airport

  def initialize
    @airport = []
  end

  def land(plane)
    @airport << plane
  end

  def take_off(plane)
    @airport.pop ? "Plane is no longer at the airport" : nil
  end
end
