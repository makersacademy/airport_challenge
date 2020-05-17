require 'weather'
require 'airport'

class Plane
  attr_accessor :plane
  attr_accessor :flying
  
  def land(plane)
    fail "Weather stormy, unable to land" if current_weather = "stormy"

    @plane = plane
  end

  def flying?
    fail "Weather stormy, unable to take-off" if current_weather = "stormy"
    land(plane)

  end
end