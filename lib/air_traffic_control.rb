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

  def takeoff_plane(_plane)
    fail "Can't takeoff - too stormy" if stormy?

    # Do we want a fail if there are no plane in port?

    "Plane tookoff"
  end

  private
  def stormy?
    @weather.status == "stormy"
  end

  def full?
    @airport.capacity_status == "full"
  end
end

