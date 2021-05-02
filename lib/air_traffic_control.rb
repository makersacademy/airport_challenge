require_relative 'weather'
require_relative 'planes'
require_relative 'airport'

class ATC

  def initialize(weather, airport)
    @weather = weather
    @airport = airport
  end
  
  def land_plane(plane)
    fail "Can't land - too stormy" if stormy?
    fail "Can't land - airport full" if full?

    "Plane landed"
  end

  def takeoff_plane(plane)
    fail "Can't takeoff - too stormy" if stormy?

    "Plane tookoff"
  end

  private
  def stormy?
    @weather.status == "stormy"
  end

  def full?
    @airport.capcity_status == "full"
  end
end
