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
end
