require_relative 'weather'

class ATC

  def initialize(weather)
    @weather = weather
  end
  
  def land_plane
    fail "Can't land - too stormy" if stormy?
  end

  def takeoff_plane
    fail "Can't takeoff - too stormy" if stormy?
  end

  private
  def stormy?
    @weather.status == "stormy"
  end
end
