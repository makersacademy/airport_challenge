require_relative 'plane'

class Airport

  def initialize(capacity = 20)
    @capacity = capacity
    @planes_landed = []
  end

  def land(plane)
    raise 'Airport has reached capacity therefore you cannot land' if @planes_landed.length >= @capacity
    @planes_landed << plane
  end

  def take_off(plane)
    'Plane has left the airport'
  end

end
