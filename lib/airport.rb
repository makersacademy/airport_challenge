require_relative 'plane'
require_relative 'weather'

class Airport

  attr :planes

  def initialize
    @planes = []
  end

  def land(plane)
    @planes << plane
    "Plane has landed"
  end

  def take_off(plane)
    @planes.delete(plane)
    "Plane has taken off"
  end

end