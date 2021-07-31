require_relative 'plane'

class Airport
  attr :plane

  def land(plane)
    @plane = plane
  end



end

airport = Airport.new
airport.land(Plane.new)
puts airport.plane