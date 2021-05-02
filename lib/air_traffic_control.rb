require_relative 'weather'
require_relative 'planes'

class ATC

  def initialize(weather)
    @weather = weather
  end
  
  def land_plane(plane)
    fail "Can't land - too stormy" if stormy?
    "Plane landed"
  end

  def takeoff_plane(plane)
    fail "Can't takeoff - too stormy" if stormy?
  end

  private
  def stormy?
    @weather.status == "stormy"
  end
end
