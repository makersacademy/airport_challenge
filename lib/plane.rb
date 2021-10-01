require 'plane'
require 'airport'
require 'weather'

class Plane
  def initialize
    @flying = []
  end

  def planes_flying(plane)
    @flying << plane
  end

  def flying?(plane) 
    @flying.include? plane
  end

  def edge_flying(plane, airport)
    fail 'Cannot takeoff plane, plane already in flight!' if plane.flying?(plane)
    fail 'Plane not at airport. Plane already in flight!' unless airport.at_airport?(plane, airport)
  end

  def edge_landed(plane, airport)
    fail 'Plane has landed, cannot land again!' if airport.at_airport?(plane, airport)
  end

  def wrong_airport(airport, another_airport)

    fail 'Plane is not in this airport!' unless (airport == another_airport)
  end
end
