require_relative 'weather'
require_relative 'planes'
require_relative 'airport'

class ATC

  def initialize(weather, airport)
    @weather = weather
    @airport = airport
  end
  
  def land_plane(plane = Plane.new)
    fail "Can't land - too stormy" if stormy?
    fail "Can't land - airport full" if full?

    @airport.plane_arrives(plane)
    return "Plane landed"
  end

  def takeoff_plane
    fail "Can't takeoff - too stormy" if stormy?
    fail "Can't perform takeoff - no planes at the airport" if airport_empty?

    @airport.plane_departs
    "Plane tookoff"
  end

  private
  def stormy?
    @weather.status == "stormy"
  end

  def full?
    @airport.capacity_status == "full"
  end

  def airport_empty?
    @airport.planes_in_port.empty?
  end
end
