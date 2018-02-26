require_relative 'airport'
require_relative 'plane'

# ATC = Air Traffic Control
class ATC

  def initialize
    @airborne_planes = []
  end

  def instruct_land(plane, airport)
    plane.land(airport)
    remove_from_airborne_planes(plane)
  end

  def instruct_take_off(plane)
    plane.take_off
    add_to_airborne_planes(plane)
  end

  def add_to_airborne_planes(plane)
    @airborne_planes << plane
  end

  def remove_from_airborne_planes(plane)
    @airborne_planes.delete(plane)
  end

end
