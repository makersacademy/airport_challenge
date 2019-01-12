require_relative 'plane'

class Airport

  def initialize
    @airport = []
  end

  def land(plane)
    @airport << plane
  end

  def take_off
    @airport.pop
    'Plane no longer in the airport'
  end


end
