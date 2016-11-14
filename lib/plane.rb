require_relative "airport.rb"
require_relative "weather.rb"

class Plane
include Weather
#attr_accessor :landed

  def initialize
    @landed = true
  end

  def land(airport)
    fail "Too stormy to land" if !sunny?
    fail "Already landed at another airport" if status
    airport.dock(self)
    land_plane
  end

  def airborne
    flying
    "Plane is now airborne"
  end

  def status
    @landed
  end

  private

  attr_accessor :landed

  def land_plane
    @landed = true
  end

  def flying
    @landed = false
  end

end
