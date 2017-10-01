require './lib/plane'

class Airport

  attr_reader :plane

  def initialize
    @planes = []
  end

  def land_at_airport(plane)
    @plane = plane
    fail "Plane already landed!" if plane.landed?
    fail "Airport full!" if @planes.count >= 20
    @planes << @plane
    plane.land
  end

end
